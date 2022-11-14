---
title: "Arch Linux ve Nvidia Optimus"
date: 2013-01-10T10:00:00Z
tags: [archlinux, nvidia]
---
Uzun süredir göz ardı ettiğim, uğraşmaktan ısrarla kaçındığım Arch Linux ve Nvidia Optimus ile yüzleşmeye karar verdim. Konuya ne kadar çözüm oldu bilmiyorum ama kendi kullanımım için ideal çözüme ulaştığımı gönül rahatlığıyla söyleyebilirim.

Bildiğiniz üzere bazı dizüstü bilgisayarlar içerisinde iki tane ekran kartı ile geliyor. Bunlardan birisi düşük performanslı olurken diğeri yüksek performanslı bir kart oluyor. Benim kullandığım dizüstüde Intel’in entegre kartı ile Nvidia’nın yüksek performanslı bir kartı bulunuyor. Nvidia’nın geliştirdiği [Optimus](https://en.wikipedia.org/wiki/Nvidia_Optimus) teknolojisi de bu kartların sistem kaynaklarının kullanımına göre en fazla performans ile veya en düşük güç tüketimi ile çalışmasına olanak sağlıyor. Senaryo Windows kullanan bilgisayarlarda sıkıntısız işliyor ki, ben de Windows'ta normal kullanımda 4 saati geçkin pil ömrü alıyordum.

Olay Linux tarafına döndüğünde her şey bu kadar güzel ilerlemiyor, tabii ki kendi haline bıraktığımızda ilerlemiyor. Linux kullanmaya Arch Linux ile bu dizüstünde başladım. X Server için ekran kartı sürücüsü yükleme aşamasına geldiğimde kararsız kalmıştım çünkü önümde en az üç seçenek vardı, ya [xf86-video-intel](https://archlinux.org/packages/?name=xf86-video-intel) kuracaktım ya [nvidia](https://archlinux.org/packages/?name=nvidia) kuracaktım ya da nvidia için açık kaynaklı başka bir sürücü olan [xf86-video-nouveau](https://archlinux.org/packages/?name=xf86-video-nouveau) kuracaktım. Arch Linux’de fazla performans gerektiren bir duruma ihtiyacım olmayacağını düşünerek inteli kurdum ve sorunsuz! bir şekilde o zamandan beri devam ettim. Tamam grafik olarak hiçbir sorun yaşamadım fakat dizüstüm aşırı ısınıyordu, buna bağlı olarak fan hiç susmuyordu ve ikisinin ortak sonucu olarak da pil ömrü 2 saati zor çıkarıyordu.

Artık dayanılmaz hale gelen bu sorunlara bir çözüm aramaya başladım ve [Bumblebee](https://bumblebee-project.org/) projesine rastladım. Bumblebee projesi tahmin edeceğiniz üzere Optimus teknolojisini Linux’e uyarlamaya çalışan bir proje. Yeni sürüm ile beraber `bbswitch` desteği ile geliyor. `Bbswitch` ile harici ekran kartını yani Nvidia’yı tamamen kapatabiliyorsunuz. Olayın beni cezbeden yanı da bu oldu zaten. Fan sesinden aşırı rahatsız olduğum zamanlar laptobu söküp Nvidia’ya dair ne varsa parçalamayı aklımdan geçirmedim değil.

Bumblebee’yi kurmadan önce her iki ekran kartının da doğru bir şekilde çalışıyor olması lazım. Yani ikisinin sürücülerinin de yüklenmiş olması lazım. Zaten bende intel kurulu olduğu için, Nvidia kart için de nouveau sürücüsünü yükledim. Kurulum çoğu konuda olduğu gibi Arch Wiki’de çok güzel anlatılmış. https://wiki.archlinux.org/index.php/Nouveau

Her iki ekran kartını da kontrol edebilmek için xorg.conf ‘da her iki driver için de ayrı device sectionları oluşturmak lazım. Daha sonra Screen section’ında ilgili driver, identifer’ı ile seçilerek test edilebilir. ~~Benim xorg.conf için kullandığım konfigürasyon dosyasına github üzerinden ulaşabilirsiniz.~~

~~Bumblebee, Arch User Repository([AUR](https://wiki.archlinux.org/title/Arch_User_Repository))’da bulunuyor.~~ Yani paketi kendiniz oluşturup daha sonra pacman ile kurmanız gerekiyor.

Önce tarball dosyası indirilir ve paketten çıkarılır:

{{< cmd >}}
wget https://aur.archlinux.org/packages/bu/bumblebee/bumblebee.tar.gz
tar -xvzf bumblebee.tar.gz
cd bumblebee/
{{< /cmd >}}

PKGBUILD dosyası bir metin editörü ile açılır ve dependencyler kontrol edilir. Bu aşamada eğer güvenilir olmayan bir uygulama indiriliyorsa paket oluşturma aşamasında zararlı bir kodun çalıştırılmadığından da emin olunur. Arch Linux ekibi özellikle kullanıcıların bu kontrolü yapabilmesi için AUR’dan paket kurma işleminin hiçbir zaman otomatikleştirilmiş bir sisteme oturtulmayacağını belirtiyor. Onun için bu işlemi öğrenmek bir arch kullanıcısı için olmazsa olmaz.

```toml
# This script is incomplete and in development.
# Maintainer: Samsagax <samsagax@gmail.com>;
pkgname=bumblebee
pkgver=3.0.1
pkgrel=4
pkgdesc="Bumblebee brings Optimus Support for Linux Through VirtualGL.
arch=('i686' 'x86_64')
depends=('virtualgl' 'libbsd' 'glib2')
```

Bizim için önemli olan depends bölümünde yazan paketler çünkü bu paketler kurulmadan paket oluşturma işlemi hata verecektir. `libbsd` ve `glib2` paketleri pacman ile direk kurulabilir çünkü official repoda bulunuyor.
{{< cmd >}}
pacman -S libbsd glib2
{{< /cmd >}}

`virtualgl` paketi ise AUR’da bulunuyor. Farklı bir klasöre `wget` ile `virtualgl`’nin tarball’ı indirilir, açılır ve PKGBUILD yine metin editörü ile düzenlenir. Bu sefer de `virtualgl`’nin dependencyleri kontrol edilir.

```
depends=('libgl' 'libxv' 'glu' 'turbojpeg')
```

Bu paketlerden `turbojpeg` dışındakiler de official repo’da bulunuyor. Pacman ile direk kurulabilir.

{{< cmd >}}
pacman -S libgl libxv glu
{{< /cmd >}}

AUR da bulunan `turbojpeg` paketi için de tarball indirme, açma ve PKGBUILD den dependeny kontrol işlemi yapılır.

```
depends=('glibc' 'libjpeg')
```

İki paket de official repoda bulunuyor. Pacman ile kurulur.

{{< cmd >}}
pacman -S glibc libjpeg
{{< /cmd >}}

En sondan başa doğru paket oluşturmaya başlıyoruz. Önce `turbojpeg`’in tarball’ını açtığımız klasörün içerisindeyken (PKGBUILD’in olduğu klasör) `makepkg` komutunu çalıştırıyoruz. Sabırlı olmanız gerekebilir.

{{< cmd >}}
makepkg
{{< /cmd >}}

Daha sonra aynı klasörde `turbojpeg-1.2.1-1-x86_64.pkg.tar.xz` isimli paketin oluşması lazım. Pacman ile kuruyoruz fakat bu sefer `-U` komutunu kullanıyoruz.

{{< cmd >}}
pacman -U turbojpeg-1.2.1-1-x86_64.pkg.tar.xz
{{< /cmd >}}

`virtualgl` paketinin tarball’ını açtığımız klasöre geçiyoruz ve `makepkg` komutunu çalıştırıyoruz. Oluşan paketi `pacman` ile kuruyoruz.

{{< cmd >}}
pacman -U virtualgl-2.3.2-1-x86_64.pkg.tar.xz
{{< /cmd >}}

Artık `bumblebee`’nin tüm dependencylerini kurduk. Sıra geldi kendisini kurmaya. Bumblebee’nin tarball’ını açtığımız klasöre geçip `makepkg` komutunu uyguluyoruz. Oluşan paketi de `pacman` ile kuruyoruz.

{{< cmd >}}
pacman -U bumblebee-3.0.1-4-x86_64.pkg.tar.xz
{{< /cmd >}}

Nihayet `bumblebee` kurulum işlemini tamamladık fakat burada bitmiyor. Kullanmak için kendimizi `bumblebee` grubuna atmamız gerekiyor.

{{< cmd >}}
gpasswd -a $USER bumblebee
{{< /cmd >}}

Sonra sistemin açılışında çalışması için `systemd` ile aktif hale getiriyoruz.

{{< cmd >}}
systemctl enable bumblebeed.service
{{< /cmd >}}

Bilgisayarı yeniden başlattığımızda sorunsuz bir şekilde optimus kullanabiliyor olmamız gerekiyor. Daha ayrıntılı kurulum ve kurulum sonrası işlemleri için arch wiki’ye bakmanızı tavsiye ederim. https://wiki.archlinux.org/index.php/Bumblebee

Sonuç olarak benim istediğim tam olarak bu değil, Nvidia kartımı tamamen devre dışı bırakmak istiyorum. Siz de böyle düşünürseniz AUR’da bulunan `bbswitch` paketini de kurmamız gerekiyor. Yukarıda diğer paketleri anlattığım şekilde bunun da kurulumunu yapıyoruz.

Kurulum tamamlandıktan sonra harici ekran kartımızın durumunu kontrol ediyoruz.

{{< cmd >}}
cat /proc/acpi/bbswitch
{{< /cmd >}}

Eğer burada ON görüyorsanız ekran kartınız devrede demektir.  Kapatabilmemiz için nouveau’nın çalışmaması gerekiyor. Ben nouveau’yu ancak açılışta kapatabildim. Eğer bilgisayar çalışırken kapatabilmenin yolu varsa bilgilendirirseniz buraya eklerim.

Açılışta kapatmak için `/etc/modprobe.d` klasöründe `nouveau.conf` isminde metin dosyası oluşturuyoruz. İçerisine de

```
blacklist nouveau
```

yazıp kaydediyoruz.

Aynı klasöre `bbswitch.conf` diye bir metin dosyası daha oluşturuyoruz. Bunun içerisine de:

```
options bbswitch load_state=0 unload_state=1
```

yazıp kaydediyoruz. Bu işlemi de `bbswitch`’in açılışta harici ekran kartı devredışı bırakması için yaptık.

Sistemi tekrar yeniden başlatıyoruz. Harici ekran kartının durumuna bakıyoruz:

{{< cmd >}}
cat /proc/acpi/bbswitch
{{< /cmd >}}

Eğer OFF görüyorsak herşey yolunda demektir. `bbswitch` hakkında detaylı bilgi için projenin github sayfasına bakmanızı tavsiye ederim. https://github.com/Bumblebee-Project/bbswitch

2 gündür bilgisayarımı harici ekran kartı kapalı bir şekilde kullanıyorum. Bugün kesintisiz 4.30 saat bataryadan kullandım. Ayrıca bilgisayarda çalışan mekanik bir diskin varlığını da uzun bir süreden sonra ilk defa hissettim. Çünkü fan neredeyse hiç çalışmadı. Tek ses harddiskten geliyor. Grafik olarak da intel’in yetmediği bir durumla da henüz karşılaşmadım.

Bu uygulamanın tam olarak optimus’a bir çözüm olduğu söylenemez ama benim sıkıntılarıma çözüm olduğu bir gerçek. Size de yardımcı olduysa ne mutlu. Sorularınız, sorunlarınız için elimden geldiğince yardımcı olmaya çalışırım.

<hr />

_Güncelleme (2014): Bumblebee paketi ve ilişkili diğer paketler Arch Linux Community Repository’e taşındı. Direk `pacman` paket yöneticisi ile Arch Linux çalışan sisteme kurulabilir._