# Custom package feed (GitHub Pages)

Этот репозиторий публикует подписанные package feeds двух форматов:

- OpenWrt 24.x: `opkg`, пакеты `.ipk`, индексы `Packages` и `Packages.gz`;
- OpenWrt 25.x и новее: `apk`, пакеты `.apk`, индекс APK v3 `packages.adb`.

Workflow автоматически выбирает формат по major-версии OpenWrt. Версии ниже
24.x этим workflow не поддерживаются; для них используйте пакеты из GitHub
Releases.

Пакеты повторно не компилируются: workflow скачивает готовые `.ipk` или `.apk`
assets из GitHub Release `v<openwrt-version>`, группирует их по target/subtarget,
создаёт и подписывает repository indexes, проверяет результат и публикует его.
Платформа публикуется только при наличии полного набора из четырёх AWG assets;
неполные наборы пропускаются с предупреждением.

Feed публикуется workflow `.github/workflows/build-feed.yml` в ветку `gh-pages` в формате:

`/<openwrt-version>/<target>/<subtarget>/`

Пример:

`/24.10.8/mediatek/filogic/`

`/25.12.3/mediatek/filogic/`

Корневой сайт feed:

`https://2grey.github.io/awg-openwrt/`

## Автоматическая установка

Установщик сам определяет точную версию OpenWrt и `target/subtarget`, добавляет
ключ подписи и feed, обновляет индекс и устанавливает `amneziawg-tools`,
`kmod-amneziawg` и `luci-proto-amneziawg`:

```sh
sh <(wget -O - https://raw.githubusercontent.com/2Grey/awg-openwrt/refs/heads/master/amneziawg-feed-install.sh)
```

Чтобы также установить русскую локализацию LuCI:

```sh
sh <(wget -O - https://raw.githubusercontent.com/2Grey/awg-openwrt/refs/heads/master/amneziawg-feed-install.sh) -r
```

Скрипт рассчитан на официальные стабильные сборки OpenWrt, для которых уже
опубликован feed. Повторный запуск безопасен: существующая запись `awg`
заменяется актуальным URL без создания дублей.

При переходе с `Slava-Shchipunov/awg-openwrt` скрипт перед обновлением ключа и
индексов сообщает об обнаруженном legacy feed и удаляет его. На OpenWrt 25.x
установленные AWG-пакеты переводятся на доступные в новом feed версии через
`apk upgrade --available`; это также снимает identity-hash ограничения,
созданные при установке локальных APK-файлов. Конфликтующий
`luci-app-amneziawg` удаляется перед установкой `luci-proto-amneziawg`.

Навигация на сайте построена по уровням:

`/<openwrt-version>/`

`/<openwrt-version>/<target>/`

`/<openwrt-version>/<target>/<subtarget>/`

В feed для OpenWrt 24.x публикуются:

- `.ipk` packages;
- `Packages`, `Packages.gz` и `Packages.manifest`;
- `Packages.sig`, созданный `usign`;
- public signing key для проверки индекса.

В feed для OpenWrt 25.x публикуются:

- `.apk` packages
- `packages.adb`
- APK v3 repository metadata, созданные из Release assets
- public signing key для проверки metadata

## OpenWrt 24.x

Сначала скачайте и добавьте public `usign` key:

```sh
wget -O /tmp/awg-openwrt-feed.pub https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub
opkg-key add /tmp/awg-openwrt-feed.pub
rm -f /tmp/awg-openwrt-feed.pub
```

Затем добавьте feed (замените `VERSION`, `TARGET`, `SUBTARGET`):

```sh
echo "src/gz awg https://2grey.github.io/awg-openwrt/VERSION/TARGET/SUBTARGET" >> /etc/opkg/customfeeds.conf
opkg update
opkg install amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```

`kmod-amneziawg` должен совпадать с точной версией OpenWrt и kernel ABI.
Например, feed для 24.10.8 нельзя использовать на 24.10.7. Пакеты,
собранные для официального OpenWrt, также могут быть несовместимы с изменённой
производителем прошивкой при совпадающем номере версии.

## OpenWrt 25.x

Сначала установите public signing key:

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem
```

Затем добавьте feed (замените `VERSION`, `TARGET`, `SUBTARGET`):

```sh
echo "https://2grey.github.io/awg-openwrt/VERSION/TARGET/SUBTARGET/packages.adb" >> /etc/apk/repositories.d/customfeeds.list
apk update
apk add amneziawg-tools kmod-amneziawg luci-proto-amneziawg
```

Минимальная проверка feed:

```sh
apk update
apk add amneziawg-tools
```

## Public signing keys

Форматы IPK и APK используют разные алгоритмы и разные пары ключей.

### IPK / OpenWrt 24.x

Public key публикуется по стабильному пути:

`https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pub`

Сгенерировать keypair с установленным `usign` можно командой:

```sh
usign -G -s awg-openwrt-feed.sec -p awg-openwrt-feed.pub
```

В GitHub Actions secrets нужно сохранить полное содержимое файлов:

- `AWG_FEED_USIGN_PRIVATE_KEY`: `awg-openwrt-feed.sec`;
- `AWG_FEED_USIGN_PUBLIC_KEY`: `awg-openwrt-feed.pub`.

Private key используется только для создания `Packages.sig` и никогда не публикуется.
`Packages.sig` и опубликованный public key дополнительно проверяются в smoke
test.

### APK / OpenWrt 25.x

Ключи публикуются в стабильном пути:

`https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem`

Для доверенной установки добавьте public key в `/etc/apk/keys/`:

```sh
mkdir -p /etc/apk/keys
wget -O /etc/apk/keys/awg-openwrt-feed.pem https://2grey.github.io/awg-openwrt/keys/awg-openwrt-feed.pem
apk update
```

Workflow подписывает все APK feed indexes одним стабильным keypair из GitHub Secrets:

- `AWG_FEED_APK_PRIVATE_KEY`
- `AWG_FEED_APK_PUBLIC_KEY`

Сгенерировать keypair можно командой:

```sh
openssl ecparam -name prime256v1 -genkey -noout -out awg-openwrt-feed.pem
openssl ec -in awg-openwrt-feed.pem -pubout > awg-openwrt-feed.pub.pem
```

В secrets нужно сохранить содержимое файлов `awg-openwrt-feed.pem` и `awg-openwrt-feed.pub.pem`. Private key не публикуется; public key публикуется на GitHub Pages как `keys/awg-openwrt-feed.pem`.
