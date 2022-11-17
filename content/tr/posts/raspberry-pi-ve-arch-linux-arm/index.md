---
title: "Raspberry Pi ve Arch Linux ARM"
date: 2013-01-22T10:00:00Z
tags: [archlinux, archlinux-arm, raspberry-pi, embedded]
---

Geçen sene Ağustos ayında bir [DIY projesi](http://www.davidhunt.ie/raspberry-pi-in-a-dslr-camera/) sayesinde Raspberry Pi ile tanıştım. O zamandan beri yapılan projeleri takip ediyordum. Nihayet geçtiğimiz günlerde siparişi verdim ve 5 gün içerisinde teslim aldım. İşin açıkçası en az 3 hafta içerisinde teslim almayı bekliyordum, bu kadar erken gelmesi sürpriz oldu.

{{< figure src="raspberry.jpg" title="Raspberry Pi" >}}

RPi kredi kartı boyutlarında her şeyiyle tam bir bilgisayar. İçerisinde ARM tabanlı bir işlemci ve kendi GPU'su bulunuyor. Güncel olan B modelinde arttırılmış 512mb ram ve ethernet girişinin yanında direk görüntü alabilmek için HDMI ve komposit video çıkışı, klavye mouse vs için 2 tane usb girişi, ses için de 3,5mm stereo jack bulunuyor. Depolama alanı olarak hafıza kartı kullanıyor. Düşük seviyede giriş-çıkış işlemleri yapabilmek için de GPIO pinleri bulunuyor. Ayrıntılı donanım bilgisi için [buraya](https://elinux.org/RPi_Hardware) bakabilirsiniz.

Yazılım olarak şu anda sadece Linux tabanlı belirli işletim sistemlerini destekliyor. En çok kullanılan ve resmi olarak tavsiye edilen dağıtım debian tabanlı RPi için geliştirilmiş olan [Raspbian](https://www.raspbian.org/). İçerisinde hazır olarak bir çok uygulama ve grafik arayüzü ile geliyor. Yani bir masaüstü ortamı sizi karşılıyor.

Bir diğer dağıtım da aynı zamanda benim en çok ilgimi çeken [Arch Linux ARM](https://archlinuxarm.org/). ARM tabanlı işlemciler için geliştirilmiş olan bu dağıtım adından da anlaşılacağı gibi Arch Linux felsefesi doğrultusunda geliştiriliyor ve normal Arch Linux’ten kullanım olarak bir farkı bulunmuyor. Yani kurulum sonrası bizi bir grafik arayüzü karşılamıyor. :)

İhtiyaçlarımıza, isteklerimize göre bir dağıtım seçtikten sonra o dağıtım için imaj dosyasını indirip hafıza kartına o imajı açmamız gerekiyor. Bunun dışında herhangi bir sistem kurulumu ile uğraşmamıza gerek kalmıyor. Ben Arch Linux ARM kullanacağım için [kendi sitesinden](https://archlinuxarm.org/platforms/armv6/raspberry-pi) en güncel imaj dosyasını indirdim. İndirilen imaj dosyasını hafıza kartına açmak için Linux sistemlerde `dd` komutu kullanılıyor. Ayrıntılı anlatım veya diğer sistemlerde kurulum için RPi’nin [wikisine](https://elinux.org/RPi_Easy_SD_Card_Setup) başvurabilirsiniz.

{{< cmd >}}
dd bs=4M if=~/Downloads/archlinux-hf-2012-09-18.img of=/dev/sdb
{{< /cmd >}}

Burada `if=` ile img dosyamızın kaynağını, `of=` ile hafıza kartımızın `/dev` klasöründeki yolunu belirtiyoruz. Burada önemli olan nokta hafıza kartının `sdb1`, `sdb2` gibi bir bölümünün değil `sdb` gibi tamamının yolunu göstermemiz gerekiyor.

{{< figure src="raspberry_running.jpg" title="Raspberry Pi Çalışırken" command="Resize" options="700x">}}

İmaj açılmış hafıza kartını RPi’ye takıp enerji verdiğimizde yaklaşık 15-20sn gibi bir süre sonra bizi kullanıcı adı ve şifre soran konsol ekranının karşılaması gerekiyor. Kullanıcı adı olarak `root` şifre olarak da `root` yazıp sisteme giriyoruz, `gpasswd` komutu ile giriş yaptıktan sonra bu şifreyi değiştirebiliriz.

Eğer bir monitör kullanılmıyorsa RPi’ye `ssh` ile uzaktan bağlanılabilir. Arch Linux ARM açılışta eğer ethernet kablosu bağlı ise otomatik IP alacak şekilde konfigüre edilmiş. Bu nedenle enerji vermeden ethernet kablosunu takmak gerekiyor. Ayrıca `ssh` daemonu kurulu ve aktif durumda geliyor. Bu nedenle ilk kullanım dahi `ssh` ile yapılabilir.

{{< cmd >}}
ssh root@192.168.1.36
{{< /cmd >}}

`ssh` ile diğer bilgisayarımızdan RPi’mize bağlanıyoruz. RPi’nizin aldığı IP adresini modeminizin/routerınız yönetici panelinden görebilirsiniz. Eğer root hesabı için şifre soruyorsa başarılı bir şekilde bağlandınız demektir.

Bundan sonrası Arch Linux ile yapabileceklerimizle sınırlı. Bir sonraki yazımda Allah’tan bir mani gelmezse Arch Linux ARM için ilk kullanımda yapılması gereken konfigürasyonları ve Apache kurulumunu anlatacağım. Daha sonra da Python ile GPIO pinleri ile uğraşmaya başlamayı umuyorum.

Kolay gelsin..
