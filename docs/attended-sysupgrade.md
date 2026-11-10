# Как обновить OpenWrt через asu.twogrey.store

Инструкция для роутеров с официальным OpenWrt **24.10.x** или **25.12.x**.
Сервер ASU соберёт образ для вашей модели. Вы скачаете его на роутер,
проверите список пакетов и отдельно запустите установку.

> [!IMPORTANT]
> Перед настройкой откройте [сайт ASU](https://asu.twogrey.store/) в браузере
> из той же сети, где находится роутер. Если страница не открывается,
> сначала проверьте подключение. В шаге 3 отдельно проверьте доступ с самого
> роутера.

Команды ниже обновляют роутер в пределах установленной ветки. Для перехода
с 24.10 на 25.12 сначала прочитайте примечания OpenWrt к обновлению. В 25.12
пакетный менеджер меняется с `opkg` на `apk`.
[Объявление OpenWrt 25.12 и порядок перехода](https://lists.openwrt.org/pipermail/openwrt-announce/2026-March/000081.html)

## 1. Узнайте версию OpenWrt и сделайте резервную копию

Подключитесь к роутеру по SSH от имени `root`. Если вы обычно подключаетесь
через VPN на этом роутере, перед прошивкой подключитесь к его локальной сети.

```sh
ubus call system board
```

Посмотрите поля `model`, `release.version` и `release.target`.
В LuCI откройте **Система → Резервное копирование / Прошивка** и скачайте
архив настроек на компьютер.
[Резервное копирование настроек OpenWrt](https://openwrt.org/docs/guide-user/installation/sysupgrade.cli)

## 2. Установите owut

Выберите команды по **текущей** версии OpenWrt. Если `owut --version` уже
показывает номер версии, переходите к настройке сервера.

### OpenWrt 24.10.x

```sh
opkg update && opkg install owut
owut --version
```

Если нужно обновить уже установленный `owut`, выполните
`opkg update && opkg upgrade owut`. При ошибке `Unknown package 'owut'`
проверьте вывод `opkg update` и доступность официальных репозиториев для
установленной версии OpenWrt.
[Установка owut в OpenWrt 24.10](https://openwrt.org/docs/guide-user/installation/sysupgrade.owut#installation_and_upgrading_owut)

### OpenWrt 25.12.x

```sh
apk -U add owut
owut --version
```

Если вы хотите сохранить AmneziaWG или другие пакеты из сторонних
репозиториев, проверьте поддержку этой возможности. Команда должна вывести
строку с `--repositories-mode`.

```sh
owut --help | grep -F -- '--repositories-mode'
```

Если строка отсутствует, выполните `apk -U upgrade owut` и повторите проверку.
Если параметр по-прежнему отсутствует, отложите обновление с сохранением
AmneziaWG до установки версии клиента с этой возможностью.
[Поддержка сторонних APK-репозиториев в owut](https://github.com/efahl/owut/pull/82)

## 3. Укажите сервер обновлений

```sh
uci set 'attendedsysupgrade.@server[0].url=https://asu.twogrey.store'
uci commit attendedsysupgrade
uclient-fetch -O /dev/null https://asu.twogrey.store/json/v1/overview.json
```

Если последняя команда скачала файл, можно запрашивать обновление. При ошибке
подключения или проверки сертификата переходите к разделу
[Что делать при ошибке](#что-делать-при-ошибке).

Чтобы снова использовать сервер OpenWrt, см. [Возврат на официальный ASU](#возврат-на-официальный-asu).

## 4. Проверьте доступность обновления и скачайте образ

Выполните `owut check` для своей ветки. В выводе убедитесь, что `ASU-Server`
показывает `https://asu.twogrey.store`, а `Profile` и `Version-to`
соответствуют вашей модели и нужной версии.

### Если у вас OpenWrt 24.10.x

В примере целевой выпуск — `24.10.8`. Укажите нужный выпуск, доступный для
вашей модели.

```sh
owut check -V 24.10.8 --verbose
```

Штатный `owut` для 24.10 не передаёт на сервер сторонние IPK-репозитории.
Если у вас установлен AmneziaWG, для его включения в образ серверу нужна
отдельно настроенная поддержка этих пакетов. Если проверка сообщает, что
пакеты AmneziaWG отсутствуют, остановитесь, пока сервер не сможет их включить.
[Исходный код owut из ветки пакетов OpenWrt 24.10](https://github.com/efahl/owut/blob/db17536ec5cbcc6a76a51e65f3d192b6a2184abb/files/owut)

Если проверка прошла, скачайте образ.

```sh
owut download -V 24.10.8 --verbose
```

### Если у вас OpenWrt 25.12.x

Если у вас установлен AmneziaWG, убедитесь, что подключён его
[подписанный репозиторий](custom-feed.md#автоматическая-установка) и
`apk update` проходит без ошибок подписи. Добавьте публичный ключ в список
файлов, сохраняемых при прошивке. Последняя команда должна вывести путь к
ключу. После добавления ключа обновите резервную копию из шага 1.

```sh
key=/etc/apk/keys/awg-openwrt-feed.pem
if [ -s "$key" ]; then
  grep -qxF "$key" /etc/sysupgrade.conf ||
    printf '\n%s\n' "$key" >> /etc/sysupgrade.conf
  sysupgrade -l | grep -Fx "$key"
else
  echo "Отсутствует ключ $key"
fi
```

В примере целевой выпуск — `25.12.6` для GL.iNet GL-MT6000
(`mediatek/filogic`). Выберите выпуск, для которого опубликованы пакеты
AmneziaWG под вашу платформу. Параметр `append` добавляет сторонние
репозитории к официальным. Если вы используете только официальные пакеты,
`--repositories-mode append` можно опустить в обеих командах.
[Доступные выпуски AmneziaWG](https://2grey.github.io/awg-openwrt/)

```sh
owut check -V 25.12.6 --repositories-mode append --verbose
```

Если проверка прошла, скачайте образ.

```sh
owut download -V 25.12.6 --repositories-mode append --verbose
```

### Если проверка сообщает об отсутствующих пакетах

Сообщение `missing to-version` означает, что указанный пакет недоступен для
целевой версии. Если можете обойтись без него, добавьте `--remove` со списком
имён через запятую к командам `check` и `download`. Исключённые пакеты
исчезнут после прошивки.

Следующие команды подходят, если при переходе на 25.12.6 проверка указывает
на Cheburprobe и тему Aurora и вы готовы обновиться без них.

```sh
exclude='cheburprobe,luci-app-cheburprobe,luci-theme-aurora'
owut check -V 25.12.6 --repositories-mode append --remove "$exclude" --verbose &&
  owut download -V 25.12.6 --repositories-mode append --remove "$exclude" --verbose
```

Используйте только имена, которые указаны в вашем выводе и которые можно
убрать. Если нужен пакет, которого нет для новой версии, отложите прошивку.
[Исключение пакетов из образа](https://openwrt.org/docs/guide-user/installation/sysupgrade.owut#adding_and_removing_packages)

## 5. Проверьте образ и установите его

Дождитесь успешного завершения `owut download`. Проверьте номер выпуска
в манифесте. Если хотите сохранить AmneziaWG, в выводе должны быть версии
всех трёх пакетов.

```sh
manifest=/tmp/firmware-manifest.json
jsonfilter -i "$manifest" -e '@.version_number'

for pkg in kmod-amneziawg amneziawg-tools luci-proto-amneziawg; do
  pkg_version=$(jsonfilter -i "$manifest" -e "@.manifest[\"$pkg\"]")
  printf '%s %s\n' "$pkg" "${pkg_version:-ОТСУТСТВУЕТ}"
done
```

### Остановите Podkop перед установкой

Если на роутере установлен Podkop, остановите его перед `owut install`.
Команда ниже проверяет наличие службы. Если остановка завершилась ошибкой,
отложите прошивку. [Обновление OpenWrt в документации Podkop](https://podkop.net/docs/install/#obnovlenie-openwrt)

```sh
if [ -x /etc/init.d/podkop ]; then
  service podkop stop
fi
```

### Установите обновление

Когда версия и нужные пакеты проверены, запустите установку. `owut install`
проверит скачанный образ, установит его с сохранением настроек и
перезагрузит роутер. Дождитесь, пока он снова станет доступен.
[Как работает owut install](https://openwrt.org/docs/guide-user/installation/sysupgrade.owut)

```sh
owut install
```

## 6. Проверьте роутер после перезагрузки

Подключитесь к роутеру снова и выполните `ubus call system board`. Убедитесь,
что установлена нужная версия. Если вы используете AmneziaWG, проверьте в
LuCI наличие трёх пакетов и состояние настроенного туннеля.

Если вы пользовались Podkop до обновления и он не запустился автоматически,
выполните `service podkop start`.

Адрес репозитория AmneziaWG должен соответствовать установленному выпуску
OpenWrt. Если в настройках остался адрес старого выпуска, повторно запустите
[установщик подписанного репозитория](custom-feed.md#автоматическая-установка).
Он подберёт адрес для текущей версии и платформы.

## Возврат на официальный ASU

Сервер по умолчанию в OpenWrt находится по адресу `https://sysupgrade.openwrt.org`.
Он собирает образы обновления OpenWrt по запросам клиентов Attended Sysupgrade.
[Официальный сервер OpenWrt](https://sysupgrade.openwrt.org)

Для возврата задайте этот адрес на роутере по SSH. Последняя команда должна
вывести `https://sysupgrade.openwrt.org`.

```sh
uci set 'attendedsysupgrade.@server[0].url=https://sysupgrade.openwrt.org' &&
  uci commit attendedsysupgrade &&
  uci get 'attendedsysupgrade.@server[0].url'
```

После переключения запустите `owut check --verbose` и проверьте строку
`ASU-Server`. Официальный сервер может отклонить сторонний репозиторий с
ошибкой `Repository not allowed`. Если вам нужен AmneziaWG из стороннего
репозитория, перед прошивкой проверьте, что все три его пакета вошли в образ.
[Сторонние репозитории на официальном ASU](https://github.com/openwrt/asu/issues/1668)

## Что делать при ошибке

- **Сервер недоступен или сертификат не проходит проверку.** Проверьте дату
  на роутере командой `date -u` и повторите `uclient-fetch` из шага 3.
  Если время верное, передайте администратору сервера полный текст ошибки.
- **`UNTRUSTED signature` на OpenWrt 25.12.** Восстановите публичный ключ
  репозитория, выполните `apk update` и добавьте ключ в список сохраняемых
  файлов, как показано в шаге 4.
  [Где взять публичный ключ AmneziaWG](custom-feed.md#apk--openwrt-25x)
- **`Repository not allowed`, ошибка сборки или `JobTimeoutException`.**
  Передайте администратору сервера модель роутера, целевую версию, строку
  `Request hash` (если она есть) и сообщение об ошибке.

### DNS перестал работать после обновления с запущенным Podkop

Если вы обновили OpenWrt, не остановив Podkop, и после перезагрузки имена
доменов перестали разрешаться, выполните эти команды на роутере по SSH.
Они заменят настроенный список вышестоящих DNS-серверов первого экземпляра
`dnsmasq` на `8.8.8.8`. [Восстановление DNS в документации Podkop](https://podkop.net/docs/install/#obnovlenie-openwrt)

```sh
service podkop stop

uci -q delete dhcp.@dnsmasq[0].server
uci add_list dhcp.@dnsmasq[0].server="8.8.8.8"
uci commit dhcp
service dnsmasq restart
ntpd -q -p ptbtime1.ptb.de

service podkop start
```
