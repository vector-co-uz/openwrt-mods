# 🛠 Xiaomi Mi Router 4A Gigabit Edition (32MB Flash Mod)

Персональные кастомные прошивки, собранные **для себя** под Xiaomi Mi Router 4A Gigabit Edition v1
с **перепаянной SPI-flash MX25L25635F (32 МБ)**.

> ⚠️ Проект не является официальным. Используйте на свой страх и риск.

---

## 📦 Текущий статус

На данный момент доступны прошивки:

- **ImmortalWRT 24.10.4**
- Минимальный набор пакетов
- Оптимизирована под 32 МБ flash
- Поддерживается обновление пакетов от официального источника
- Добавлены сторонние репозитории пакетов

---

## 🔧 Характеристики прошивки

- 🧠 **Проект:** ImmortalWRT  
- 📌 **Версия:** 24.10.4  
- 💾 **Flash:** 32 МБ (MX25L25635F)  
- 📡 **Устройство:** Xiaomi Mi Router 4A Gigabit Edition v1
- 🚀 **Загрузчик:** **U-Boot**, **Breed**
- 📦 **Свободно для установки пакетов:** ~20 МБ
- 🆙 **IP адрес роутера:** 10.10.11.1

---

## 📚 Репозитории пакетов

В прошивку добавлены дополнительные источники пакетов:

- [🔗](https://github.com/fantastic-packages/packages) fantastic-packages

---

### Скачать:

1. [Версия initramfs для прошивки из-под загрузчика (bootloader)](./immortalwrt/immortalwrt-24.10.4-ramips-mt7621-xiaomi_mi-router-4a-gigabit-initramfs-kernel.bin)
2. [Версия с IPv6 и дополнительными пакетами](./immortalwrt/immortalwrt-24.10.4-mesh-32mb-ru-ramips-mt7621-xiaomi_mi-router-4a-gigabit-squashfs-sysupgrade.bin)
3. [Версия без IPv6, но с дополнительными пакетами](./immortalwrt/immortalwrt-24.10.4-mesh-without-ipv6-32mb-ru-ramips-mt7621-xiaomi_mi-router-4a-gigabit-squashfs-sysupgrade.bin)
4. [Версия без дополнительных пакетов, только с изменённой разметкой](./immortalwrt/immortalwrt-24.10.4-ramips-mt7621-xiaomi_mi-router-4a-gigabit-squashfs-sysupgrade.bin)
5. [Bootloader Breed](./immortalwrt/boot_breed_30000.bin)
6. [Bootloader uBoot](./immortalwrt/uboot-mtk_r4a.bin)
   
---
## 📥 Установка

[Инструкция по прошивке доступна в теме форума 4PDA](https://4pda.to/forum/index.php?showtopic=988197&st=23520)

### Для U-Boot:
1. Залить прошивку через U-Boot (TFTP / UART / Web — по вашей конфигурации)
2. Первый запуск может занять больше времени
3. Далее стандартная настройка ImmortalWRT

### Для Breed:
- [Ссылка на прошивку для Breed](https://4pda.to/forum/index.php?showtopic=988197&view=findpost&p=136835762)  
> ⚠️ Использовать на свой страх и риск. Поддержка Breed ограничена, прошивка тестировалась на MX25L25635F 32 МБ.

---

## ❗ Важно

- Прошивки собраны **под конкретное железо**
- Не предназначены для других моделей Mi Router 4A 
- Перед прошивкой **обязательно сделайте backup**

---

✅ Собрано для личного использования.  
✅ Если вам понравился проект — не забудьте поставить звёздочку ⭐   
✅ [Ссылка для покупки MX25L25635F](https://ali.click/sxjrui)
