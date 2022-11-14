---
title: "Linux, Arch Linux"
date: 2012-12-22T10:00:00Z
tags: [archlinux, dwm, linux]
---
1 yılı aşkın süredir Arch Linux kullanıcısıyım. Daha önceleri ubuntu, pardus, debian gibi Linux* dağıtımlarını incelemiştim ama hiçbiri uzun soluklu olmamıştı, çünkü aradığımı bulamamıştım. Dönüp kendime baktığımda ne aradığımı bilmiyormuşum ki diyorum fakat o zamanlar benim için; bahsedilen, kafamda canlandırdığım Linux mantığından, yaşadığım tecrübeler biraz uzaktı. Arkaplanda ne olduğundan bi haber, kullanımı kolay!, kapalı bir kutu gibi gözüktü, bu yüzden tekrar Windows’a döndüm. Taa ki Dwm (dynamic window manager) ile tanışana kadar.

[Dwm](https://dwm.suckless.org/) basit, son derece sade, hiçbir görsel efekt barındırmayan sadece işini yapan bir WM ([window manager](https://en.wikipedia.org/wiki/Window_manager)). C’de yazılmış ve biraz C bilgisi ile, anlaşılabilir yapısı sayesinde çok kolay özelleştirmeler yapılabiliyor. Dwm’yi kurcalarken ve daha önce yapılan özelleştirmeleri de incelerken sık sık Arch Forum ve Arch Wiki ile karşılaştım, biraz araştırınca Arch Linux’un kullanmam gereken bir dağıtım olduğuna karar verdim.

[Arch Linux](https://wiki.archlinux.org/title/Arch_Linux), geliştiricilerinin tabiriyle “it is what you make it” olarak tanımlanıyor. Yani senin yaptığın şey, hemen hemen sıfırdan kullanıcının geliştirdiği bir ortam. Başarılı bir Arch Linux kurulumu yapıldıktan sonra bizi shell karşılıyor. Komut satırı ve bir metin editörü (vi,vim,nano) ile sistemi kendimize göre konfigüre etmeye başlıyoruz. Pacman adında Arch Linux’un kendi paket yöneticisi bulunuyor. Bu paket yöneticisini kullanarak çok kolay bir şekilde çoğu uygulamanın en güncel versiyonunu kurabiliyoruz. Sistemimizde GUI uygulamalarını çalıştırmamız için bugün hemen hemen her dağıtımda kullanılan Gnome, Kde gibi masaüstü ortamlarının (DE) da çalışmasını sağlayan altyapımız X Window Manager’i kurmamız gerekiyor. Bunu kurduktan sonra GUI’ye sahip programları da çalıştırılabilecek duruma geliyoruz. Tabi X’i bu haliyle kullanmak çok zor ve yetersiz, istersek bilinen DE’ler kurabiliriz bu aşamada ve çok modern bir arayüze sahip olabiliriz. Ama ben sadece WM kullanmayı tercih ediyorum. WM de kurduktan sonra, gerekli uygulamaları pacman paket yöneticisi ile kurup, sistemimizi hazır hale getirebiliyoruz. Pacman ile bir program kurulurken program için gerekli olan dependency (bağlı olunan diğer paketler) ler de otomatik kuruluyor. Yani direk pacmanla Firefox kurmak istediğimizde başarılı oluyoruz. Gerekli kütüphaneler, derleyiciler, paketler otomatik kuruluyor. Arch Linux’un sürekli güncel tutulan ingilizce wikisinden kurulum ve kurulum sonrası konfigürasyon hakkında detaylı bilgiye ulaşılabilir. Wiki adım adım takip edilirse sorunsuz bir şekilde kurulum da konfigürasyon da tamamlanabilir. Zaman ve sabrınız da varsa, eksik bir şey kalmıyor.

Sonuç olarak kendi isteklerinize göre çalışan sizin yaptığın bir işletim sistemine sahip oluyorsunuz. Neyin nerede olduğunu, bir sorun çıktığında nereden kaynaklandığını, çözümü dair keywordlere elinizin altındaymış gibi ulaşabiliyorsunuz. Bir süre sonra vazgeçilmeziniz oluyor.

Linux’a yeni başlayacak birisi için Arch Linux, benim için doğru bir tercih olduğu kadar onlar için de olur mu bilmiyorum. Diğer dağıtımlarda biraz terminal bilgisi, metin editörleri kullanımı, bazı basit komutların kullanımı öğrenilip sonra Arch Linux tercih edilse daha doğru olabilir. Ben ikisini de bir arada götürmeye çalıştım, bazen çok zorlandım ama birazcık azimle aşılmayacak bir engel değil bence.

Linux, Arch Linux ile ilgileniyorsanız ve ‘sorunlarınız, sorularınız’ varsa elimden geldiğince yardımcı olmaya çalışırım.

Hatalı bir bilgi varsa lütfen düzeltebilmem için ya özelden ya da genelden beni bilgilendirin.

—
*Linux: GNU/Linux