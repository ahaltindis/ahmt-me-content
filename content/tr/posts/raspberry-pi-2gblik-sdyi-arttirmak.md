---
title: "Raspberry Pi - 2 GB'lik SD’yi Arttırmak"
date: 2013-04-10T10:00:00Z
tags: [archlinux-arm, raspberry-pi]
---
Raspberry Pi için hazırlanmış imaj dosyalarında root dizini 2 GB'ye ayarlanmış bir şekilde geliyor. Bu nedenle en az bu boyutta bir kart kullanmak gerekiyor. Daha büyük boyutta SD kullanmak bir sorun çıkarmıyor fakat alanın 2 GB üstündeki kısmı boşa gitmiş oluyor. Bunu kullanabilmek için bir kaç şey yapmak gerekiyor.

Şu an kullandığım Raspberry Pi 16 GB'lik bir kart kullanıyor. Varsayılan olarak 2 GB'si root dizini tarafından kullanılırken kalan 14 GB home için kullanılıyor. Bunu SD’nin kalan bölümü için part oluşturup home kısmına mount ederek yapmıştım. Fakat bu kullanımın pek kullanışlı olmadığını gördüm. Çünkü şimdiye kadar home dizininde pek bir dosya saklama ihtiyacı hissetmedim. Öte yandan yeni paketler kurmak için veya Apache Server'da çalıştırılan local dosyaları saklamak için 14 GB’ye root dizininde çokça ihtiyacım oldu. Bu nedenle SD kartın tamamını root dizine vermeye karar verdim, bu sayede home için ayrı bir bölüme de gerek kalmadı.

Bunu yapabilmek için root dizinin bulunduğu bölümü (genelde `mmcblk0p2` oluyor) silip, aynı başlangıçta ve bitişi SD kartın sonunu gösterecek şekilde yeni bir bölüm oluşturmak gerekiyor. Bu değişiklik sadece `partition table`’da yapılacağı için root dizinindeki veriler kaybolmuyor.

RPi’ye bağlanıp `fdisk` ile disk açılır:

{{< cmd >}}
fdisk /dev/mmcblk0
{{< /cmd >}}

`p` ile partlar listelenir. Normalde burada boot için `mmcblk0p1` ve root için `mmcblk0p2` olması gerekiyor. Ben sonradan `mmcblk0p3` oluşturup onu da home dizinine mount etmiştim. Şimdi içindekileri yedekleyip bu bölümü sildim, `mmcblk0p2`’den sonra başka bölüm kalmaması gerekiyor.

Burada dikkat edilmesi gereken nokta `mmcblk0p2`’nin başlangıç noktası. Arch Linux ARM’de bu değer 194560 olarak gözüküyor.

Daha sonra,

`d` ile `mmcblk0p2` (2 numaralı) bölüm de silinir.

`n` ile ile yeni bölüm oluşturulur. Primary seçeneği için `p` yazılır. Default value olarak gösterilen değerin önceki başlangıç değerine eşit olması gerekiyor. Eşit ise enter’e basıp geçilir. Bitiş değeri için default value, eğer silmeyi unuttuğunuz başka bir bölüm kalmadıysa SD kartın sonunu gösterecektir. Enter ile bu da geçilir ve yeni root bölümü oluşturulmuş olur.

`w` ile değişiklikler kaydedilir ve `p` ile yapılan değişiklikler gözlenebilir.

RPi yeniden başlatılır. Yeniden başlattıktan sonra root dosya sistemini yeniden boyutlandırmak gerekiyor. Bunun için de;

{{< cmd >}}
resize2fs /dev/mmcblk0p2
{{< /cmd >}}

komutu çalıştırılır. SD kartın büyüklüğüne göre işlem süresi değişebilir.

{{< cmd >}}
df -h
{{< /cmd >}}

komutu ile root dizinin yeni boyutu görülebilir.

Kaynak: http://elinux.org/RPi_Resize_Flash_Partitions
