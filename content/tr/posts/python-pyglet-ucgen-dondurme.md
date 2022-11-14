---
title: "Python’da Pyglet ile 2D Üçgen Döndürme"
date: 2014-11-17T10:00:00Z
tags: [grafik, python, matematik]
---
En iyi öğrenme metodunun uygulayarak, deneyerek, yanılarak olduğunu bayağı önceleri kavradım. Okul derslerinde bu yöntemi uygulamak ne yazık ki kimi zaman mümkün olmasa da, elimden geldiğince, konular dersler ilgimi çektikçe yapmaya çalışıyorum.

Bu nedenle Bilgisayar Grafik dersinde gördüğüm verilen bir noktaya göre üçgeni belirli bir açıyla döndürme işlemini Python ve Pyglet kütüphanesi ile gerçekleştirmek istedim. Kodda sonuca odaklandım, aynı işi çok daha iyi yaklaşımlarla yapmak elbette mümkündür.

### Matematiksel Hesaplama:
Üçgenimizin köşelerinin `A1(x1,y1)` `A2(x2,y2)` `A3(x3,y3)` olduğunu, etrafında döndürülmesi istenen noktanın `R(m,n)` olduğunu ve verilen açının da `θ` olduğunu kabul edelim.
Öncelikle üçgenin her köşesini `[x  y  1]` formatına çevirip 3×3’lük matrisi elde edelim:
```
ucgen_matris =
[x1  y1  1]
[x2  y2  1]
[x3  y3  1]
```

Daha sonra bu noktaları verilen referans noktaya göre orijine öteleyecek matrisi oluşturalım:
```
otele1_matris =
[ 1  0  0]
[ 0  1  0]
[-m -n  1]
```

Orijin etrafında üçgenimizi verilen açı kadar saat yönünün tersine döndürecek matrisi oluşturalım:
```
dondur_matris =
[ cosθ  sinθ  0]
[-sinθ  cosθ  0]
[  0     0    1]
```

En son olarak da döndürülen üçgeni verilen referans noktaya göre eski yerine taşıyacak matrisi oluşturalım:
```
otele2_matris =
[1  0  0]
[0  1  0]
[m  n  1]
```

Oluşturduğumuz bu transform matrislerini sırasıyla üçgen matrisimize uygularsak, üçgenimizin yeni koordinatlarını elde ederiz:
```
ucgen_matris x otele1_matris x dondur_matris x otele2_matris =
[x'1  y'1  1]
[x'2  y'2  1]
[x'3  y'3  1]
```

### Python’da Gerçekleştirme:
Program 4 aşamadan oluşuyor. Üçgen çizme, referans nokta alma, açı değerini alma ve yeni üçgeni ekrana çizdirme olarak. Aşamalar sequential yani birbiri ardına devam edecek şekilde ilerliyor.

Kullanıcı girdisi `on_mouse_press` ile ekrana tıklanılan koordinatlardan, açı değeri de konsoldan `raw_input` ile alınıyor.
Yeni oluşturulacak üçgen `ucgen_hesapla` fonksiyonu ile bulunuyor.
Sonsuz döngüde çalışan `on_draw` fonksiyonu ile ekrana o an çizilmesi gereken üçgen, nokta veya yeni üçgenin çizimi yapılıyor.

Kodun tamamına github sayfasından ulaşabilirsiniz: [2d_ucgen_dondurme.py](https://github.com/ahaltindis/bilgisayar-grafik-uygulama/blob/bbef6eee71b786b2c1f61bd71e77f355e95330a5/2d_ucgen_dondurme.py)
