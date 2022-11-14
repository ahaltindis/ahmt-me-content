---
title: "Linux ve Java üzerine bir kitap.."
date: 2013-01-03T10:00:00Z
tags: [kitap, java, linux]
---

Geçenlerde, finallerin de yaklaşması sebebiyle! StumbleUpon’da vakit geçirirken [Linux hakkında yazılmış 10 bedava kitap](http://www.stumbleupon.com/su/1W1BOZ/royal.pingdom.com/2012/02/24/10-free-linux-e-books/) ismiyle bir sayfa ile karşılaştım. ‘Yeni yetme’ bir java programcısı ve meraklı bir linux kullanıcısı olarak bu kitaplar arasında bulunan “Java application development on Linux” kitabının adı ilgimi çekti ve kitabın da zaten bedava olmasından dolayı kolayca indirip incelemeye başladım.

Kitabın büyük bir bölümünü merakla ve sıkılmadan okudum. Kitap 2004 basım, biraz eski olsa da zaten bir referans kitabı olmadığı için -zaten güncel bir referans kitabı bulmak da imkansız bir durum- bence güncelliğini hala koruyor.

İçerik olarak kitap, öncelikle linux ortamı hakkında bilgi veriyor. Komut satırında yapabileceklerimiz konusunda ufkumuzu açıyor. Giriş/Çıkış işlemlerinden bahsediyor. Komut satırında komutların birbirleri ile nasıl bağlanabileceğini (pipes), olayların arkaplanda nasıl çalıştığını anlatıyor. Linux sistemlerde temel olarak gelen bir çok komutu (ls, cp, mv, grep, less, man, awk, vs) kısa kısa açıklıyor ve örnekler veriyor. Bence bu bölüm Linux hakkında hiçbir bilgisi olmayan, komut satırından korkan bir çok kişiye çok faydalı ve zevkli gelecektir.

İkinci bölümde metin düzenleyicilerden bahsediyor. Ağırlı olarak Vi’yi ele alıyor. Zaten yazar(lar), tek bir shell öğrenilecekse bash, tek bir editör öğrenilecekse vi öğrenilmeli diyor. Vi/Vim‘de düzenleme, arama ve birçok işlemi yine kısaca ele alıyor ve örnekler veriyor. Grafik arayüzüne sahip editörlerden de bahsediyor.

Daha sonra kitap Java’ya ani bir giriş yapıyor. Veri yapılarından, söz diziminden bahsediyor. Döngüler, sorgular gibi programlamanın temellerini kısa örnekler vererek gösteriyor. Nesne temelli programlamanın Java ile ilişkisini ve Java’nın kendine özel paket yapısını, paket oluşturmayı ve bunları projeye import etmeyi anlatıyor.

Kitap, 5, 6 ve 7. bölümlerde Sun Java, IBM Java ve Gnu Java compiler kullanımını anlatıyor. Bu bölümler her ne kadar komut satırında java ile yazılmış bir programı derleme konusunda çok temel bilgiler verse de sıkılmadan okunabilecek bir bölüm -en azından benim- için değildi. Ayrıca güncelliğini de ne kadar koruyor, konu hakkında çok bilgili olmadığım için bilmiyorum.

Kitap daha sonra, kaynak kod kontrol sistemlerinden birisi olan, belki de kitap yazılırken tek olan [CVS](https://en.wikipedia.org/wiki/Concurrent_Versions_System)‘den bahsediyor. Sürüm kontrolünün nasıl yapılacağı, senaryonun nasıl işlediği konularında verdiği bilgiler şu an aktif olarak kullanılan git, mercurial gibi sürüm kontrol sistemlerinin kullanım amacını anlama açısından da faydalı olabilir.

Kitap 10. bölümde ve ilk kısmın son bölümünde Java için iki büyük IDE olan Netbeans ve Eclipse programlarından bahsediyor. Tabii ki de herhangi bir güncelliği bulunmuyor bu bölümün çünkü bahsi geçen programların, kitap yazıldığı tarihten itibaren çok ciddi evrimler geçirdiği kolayca görülebiliyor.

Kitabın belki de en sevdiğim bölümü olan 11.bölümde bir programcının ve işverenin arasında geçen senaryo anlatılıyor. Büyük projede çalışacak fırsatı olmamış, henüz ‘yeni yetme’ olan bir geliştiricinin olaya nasıl yaklaşması gerektiği gibi önemli ve güncelliğini kolay kolay yitirmeyecek olan konular ele alınıyor. Bilgi toplama, problem tanımlama, teknik yeterlilikler, test süreci, sürüm kontrolü, üretim, hata düzeltme gibi ana başlıklarda süreç ele alınıyor. Ayrıca bütçe, dökümantasyon gibi konular da senaryo gereği ele alınıyor. Daha sonra kitabın bir kaç bölümü de bu süreçlerin ayrıntılı açıklamasını ele alıyor.

Kitap 14.bölümde veritabanlarından bahsediyor. O zaman ve hala güncel ve geçerli olan MySQL, PostgreSQL ve Oracle hakkında bilgiler veriyor. Hangisinin seçilmesinin hangi durumda daha ‘iyi’ olabileceğine dair önseziler, ipuçları veriyor.

Diğer bölümde Java’nın veritabanlarıyla iletişime geçmek için kullandığı JDBC apisinin kullanımını anlatıyor ve bu üç büyük veritabanı için örnekler veriyor.

Kitap 16.bölümde ve kitabın 3. kısmında Java ile GUI tasarımından bahsediyor. Swing kütüphanesini anlatıyor ve daha önceki bölümlerde geliştirdiği konsol uygulaması için basit bir arayüz geliştirme sürecini ele alıyor. Diğer bölümde de SWT’den bahsediyor.

Kitabın 4. kısmında Web Arayüzü geliştirmek ele alınıyor. 18.bölümde statik html sayfaların java ile oluşturulması anlatılırken 19.bölümde şu an için daha güncel ve önemli olan JSP ile dinamik web sayfası geliştirmesi anlatılıyor.

Sonuç olarak kitap buraya kadar benim için faydalı oldu diyebilirim. Java öğrenmek için elbette tek başına doğru bir kitap değil. Hem güncelliğini çok koruyamayışı nedeniyle hem de konuları ele alış metoduyla bunun gibi bir misyonu üstlenmekten kendini soyutlamış. Ama nereden başlayacağını bilmeyen, linux sistemlere meraklı, çalışma şekli olarak da konu başlıklarını alıp içeriği daha güncel kaynaklardan doldurma niyetinde olan birisi için güzel ve okunası kitap. İnglizce seviyesi ve anlatım dili de basit, kolay, anlaşılabilir.

Kitabın kendisini e-kitap olarak ve içerisinde geçen örnekleri de zip olarak [bu sayfadan](http://javalinuxbook.com/html/downloads.html) indirebilirsiniz.
