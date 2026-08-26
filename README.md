# Пакеты AmneziaWG для роутеров с прошивкой OpenWrt

[English](README.en.md) | Russian

![AmneziaWG2.0](https://img.shields.io/badge/AmneziaWG-2.0-green)
![AmneziaWG3.0](https://img.shields.io/badge/AmneziaWG-3.0-orange)
![AmneziaWG3.1](https://img.shields.io/badge/AmneziaWG-3.1-red)

![OpenWrt 24](https://img.shields.io/badge/OpenWrt-24.10.4_~_24.10.8-blue)
![OpenWrt 25](https://img.shields.io/badge/OpenWrt-25.12.0_~_25.12.5-teal)

## Custom package feed (GitHub Pages)

В репозитории также публикуется полнофункциональный [репозиторий пакетов OpenWrt](https://2grey.github.io/awg-openwrt/), включающий подписанные репозитории IPK для OpenWrt 24.x и подписанные репозитории APK для OpenWrt 25.x и более поздних версий.

## Установка

### Через Custom package feed

1. Установите пакеты из подписанного репозитория (точная версия OpenWrt и целевая платформа определяются автоматически):  
    
    Для установки русской локализации добавьте флаг `-r` к команде.

    ```sh
    sh <(wget -O - https://raw.githubusercontent.com/2Grey/awg-openwrt/refs/heads/master/amneziawg-feed-install.sh)
    ```

2. Перезагрузите роутер для загрузки новых модулей ядра
3. Настройте новый интерфейс с протоколом `AmneziaWG VPN`

### Через скрипт настройки

Если вам нужно только установить пакеты, используйте скрипт `amneziawg-install` - он автоматически скачает пакеты из этого репозитория под ваше устройство, а также предложит сразу настроить интерфейс с протоколом AmneziaWG.

Если вы согласитесь, потребуется ввести запрошенные параметры конфигурации.  
При этом скрипт создаст интерфейс, настроит для него правила фаерволла, а также включит маршрутизацию адресов из AllowedIPs; по умолчанию это весь IPv4- и IPv6-трафик (установит в настройках Peer галочку Route Allowed IPs).

Для запуска скрипта подключитесь к роутеру по SSH, введите команду и следуйте инструкциям на экране.

```sh
sh <(wget -O - https://raw.githubusercontent.com/2Grey/awg-openwrt/refs/heads/master/amneziawg-install.sh)
```

> [!IMPORTANT]
> При чистой установке скрипт может загрузить модуль ядра и настроить интерфейс без перезагрузки.
> Если после обновления в памяти остался старый модуль ядра, перезагрузите роутер и повторно запустите скрипт.

Дополнительные флаги скрипта:

| Флаг | Описание                           |
|------|------------------------------------|
| -e   | НЕ устанавливать пакет локализации |
| -n   | НЕ настраивать интерфейс AmneziaWG |
| -a   | Профиль подключения: 2.0, 3.0, 3.1 или авто (по умолчанию: авто) |
| -c   | Импортировать параметры подключения из .conf файла |
| -i   | Имя интерфейса OpenWrt (по умолчанию: awg1) |

Установщик может настраивать профили подключения AWG 2.0, 3.0 и 3.1

Для импорта подходит конфигурация, содержащая ровно одну секцию `[Peer]`. Конфигурации с несколькими узлами настраивайте через LuCI.

```sh
sh amneziawg-install.sh -e -a auto -c /root/client.conf
```

Чтобы интерактивно ввести настройки для определенного профиля подключения:

```sh
sh amneziawg-install.sh -a 2.0
sh amneziawg-install.sh -a 3.0
sh amneziawg-install.sh -a 3.1
```

> [!NOTE]
> Скрипт проверяет версию, указанную установленным `amneziawg-tools`,
и отказывается настраивать более новый профиль для более старых версий.
> Если после обновления все еще загружен более старый модуль ядра, перезагрузите маршрутизатор и запустите скрипт снова.

### Проверка информации о роутере

Скрипт выводит версию OpenWrt и LuCI, `target` и `subtarget`, версии установленных пакетов из этого репозитория, а также версию загруженного модуля ядра AmneziaWG:

```sh
sh <(wget -O - https://raw.githubusercontent.com/2Grey/awg-openwrt/refs/heads/master/amneziawg-check.sh)
```

### Ручная установка пакетов

Скачайте три обязательных пакета — `amneziawg-tools_*`, `kmod-amneziawg_*` и `luci-proto-amneziawg_*` — со страницы [релизов](https://github.com/2Grey/awg-openwrt/releases) под вашу платформу. Для русской локализации дополнительно скачайте необязательный пакет `luci-i18n-amneziawg-ru_*`. В OpenWrt 24.10 используются пакеты `.ipk`, а в OpenWrt 25.12 — `.apk`.

#### Выбор пакетов для своего устройства

В соответствии с пунктом [Указываем переменные для сборки](https://github.com/itdoginfo/domain-routing-openwrt/wiki/Amnezia-WG-Build#%D1%83%D0%BA%D0%B0%D0%B7%D1%8B%D0%B2%D0%B0%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D1%8B%D0%B5-%D0%B4%D0%BB%D1%8F-%D1%81%D0%B1%D0%BE%D1%80%D0%BA%D0%B8) определить target и subtarget вашего устройства.

Далее перейдите на страницу релиза, соответствующего вашей версии OpenWrt, и с помощью поиска по странице (Ctrl+F) найдите три обязательных пакета для своего устройства. Их имена оканчиваются на `target_subtarget.ipk` для OpenWrt 24.10 или на `target_subtarget.apk` для OpenWrt 25.12.

#### Список поддерживаемых версий OpenWrt

1. [25.12.5](https://github.com/2Grey/awg-openwrt/releases/tag/v25.12.5) – AWG-3.1
2. [25.12.4](https://github.com/2Grey/awg-openwrt/releases/tag/v25.12.4) – AWG-3.1
3. [25.12.3](https://github.com/2Grey/awg-openwrt/releases/tag/v25.12.3) – AWG-3.1
4. [25.12.2](https://github.com/2Grey/awg-openwrt/releases/tag/v25.12.2) – AWG-3.1
5. [25.12.1](https://github.com/2Grey/awg-openwrt/releases/tag/v25.12.1) – AWG-3.1
6. [25.12.0](https://github.com/2Grey/awg-openwrt/releases/tag/v25.12.0) – AWG-3.1
7. [24.10.8](https://github.com/2Grey/awg-openwrt/releases/tag/v24.10.8) – AWG-3.1
8. [24.10.7](https://github.com/2Grey/awg-openwrt/releases/tag/v24.10.7) – AWG-3.1
9. [24.10.6](https://github.com/2Grey/awg-openwrt/releases/tag/v24.10.6) – AWG-3.1
10. [24.10.5](https://github.com/2Grey/awg-openwrt/releases/tag/v24.10.5) – AWG-3.1
11. [24.10.4](https://github.com/2Grey/awg-openwrt/releases/tag/v24.10.4) – AWG-3.1

## Сборка пакетов

В репозитории есть скрипт, который получает с сайта OpenWrt список поддерживаемых платформ и автоматически запускает сборку пакетов AmneziaWG для всех устройств.

Сборки для более старых версий OpenWrt доступны в репозитории [Slava-Shchipunov/awg-openwrt](https://github.com/Slava-Shchipunov/awg-openwrt).

### Сборка для всех поддерживаемых устройств

1. Создайте форк этого репозитория.
2. Перейдите на вкладку **Actions** и включите GitHub Actions — по умолчанию они отключены в форках.
3. Перейдите на вкладку **Code**, откройте раздел **Releases** в правой части страницы и нажмите **Draft a new release**.
4. Нажмите **Choose a tag** и создайте тег в формате `vX.X.X`, где `X.X.X` — требуемая версия OpenWrt, например `v24.10.8`.
5. В качестве целевой ветки выберите `master`.
6. Укажите название релиза.
7. Нажмите **Publish release**. Создание тега запустит сборку пакетов.

Для публичных репозиториев GitHub предоставляет бесплатные стандартные раннеры. В имеющихся workflow одновременно запускалось до 20 задач. Каждая задача обычно занимает 10–15 минут, а полная сборка — около 60 минут.

### Сборка для определённой платформы

Инструкция по сборке пакетов AWG 1.0 для определённой платформы приведена в [Wiki](https://github.com/itdoginfo/domain-routing-openwrt/wiki/Amnezia-WG-Build). Такая сборка занимает около двух часов.

Текущий стек AWG 3.1, совместимый с профилями подключения AWG 2.0 и 3.0, для определённых платформ можно собрать следующим образом:

1. Создайте форк этого репозитория.
2. Перейдите на вкладку **Actions** и включите GitHub Actions — по умолчанию они отключены в форках.
3. В списке workflow слева выберите **Create Release on Tag**.
4. Нажмите **Run workflow**.
5. Укажите версию OpenWrt, например `24.10.8`; список `target` через запятую, например `stm32,ramips`; и список `subtarget` через запятую, например `stm32mp1,mt7621`. Сборка будет выполнена только для существующих пар `target/subtarget`.
6. Нажмите **Run workflow**. Сборка для одного устройства обычно занимает 10–15 минут; после её завершения будет создан релиз для указанной версии OpenWrt.

### Сборка для OpenWrt Snapshot

Workflow **Build OpenWrt Snapshot** проверяет текущую ревизию и ABI ядра OpenWrt Snapshot, собирает APK-пакеты и публикует их как prerelease. Если все четыре пакета для этой ревизии, платформы и ABI уже опубликованы, повторная сборка пропускается.

Для ручного запуска откройте **Actions → Build OpenWrt Snapshot → Run workflow**. Оставьте `target` и `subtarget` пустыми, чтобы собрать все доступные платформы. Для выборочной сборки укажите оба списка через запятую.

Workflow также запускается каждые три дня месяца в `21:17 UTC` (`01:17` по Самаре) по расписанию `17 21 */3 * *` и проверяет все поддерживаемые пары `target/subtarget`. `microchipsw/lan969x` временно пропускается: его Snapshot SDK не может упаковать `kmod-crypto-xxhash`, поскольку `xxhash.ko` встроен в ядро.

GitHub запускает `schedule` только для workflow из основной ветки репозитория. В форке также необходимо предварительно включить GitHub Actions.
