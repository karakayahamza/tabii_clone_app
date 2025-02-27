# README for Tabii Clone App


Tabii Clone App, popüler dijital film ve dizi platformu Tabii'nin Flutter kullanılarak geliştirilmiş bir klonudur. Uygulama, kullanıcıların Google hesaplarıyla hızlı ve kolay giriş yapmalarını sağlayan bir giriş ekranına sahiptir. Firebase entegrasyonu ile çalışan bu uygulama, orijinal platformun deneyimini yansıtacak şekilde modern ve şık bir karanlık tema ile tasarlanmıştır.

## Özellikler

- **Splash Ekranı**: 
  - Uygulama başlatıldığında, kullanıcıya uygulamanın logosunu veya markasını gösteren bir splash ekranı ile karşılaşır. Bu ekran, uygulamanın başlatılması sırasında kullanıcı deneyimini iyileştirir.

- **Giriş Ekranı**: 
  - Giriş ekranı, kullanıcıların yalnızca Google hesaplarıyla kayıt olmalarını veya giriş yapmalarını sağlayan basit bir arayüze sahiptir. Bu, kullanıcıların geleneksel kullanıcı adı ve şifre girişi yapmadan hızlı bir şekilde oturum açmalarını sağlar.

- **Ana Ekran**: 
  - Başarılı bir girişin ardından kullanıcılar, uygulamanın ana ekranına yönlendirilir. Bu ekran, kullanıcıların uygulamanın çeşitli işlevlerine erişim sağlamasına olanak tanır.

- **Karanlık Tema**: 
  - Uygulama, düşük ışık koşullarında göz yorgunluğunu azaltmak için karanlık bir tema ile tasarlanmıştır. Renk paleti, okunabilirliği artırmak için dikkatlice seçilmiştir.

## Kullanılan Teknolojiler

- **Flutter**: 
  - Uygulamanın geliştirilmesinde kullanılan çerçeve, tek bir kod tabanı ile çapraz platform geliştirme imkanı sunar.

- **Firebase**: 
  - Kullanıcı kimlik doğrulaması ve veri yönetimi için arka uç hizmetleri sağlamak amacıyla kullanılır. Firebase, kullanıcı verilerini ve uygulama durumunu yönetmek için sağlam ve ölçeklenebilir bir çözüm sunar.

## Kod Yapısı

Uygulamanın ana giriş noktası `lib/main.dart` dosyasında bulunmaktadır. İşte ana bileşenlerin kısa bir özeti:

- **Firebase Başlatma**: 
  - Uygulama, ana uygulama çalıştırılmadan önce Firebase hizmetlerini başlatır. Bu, uygulama başladığında tüm Firebase işlevlerinin kullanılabilir olmasını sağlar.

- **MyApp Sınıfı**: 
  - Uygulamanın kök widget'ıdır ve `MaterialApp`'i yapılandırarak temalar ve yönlendirmeler ayarlar. Uygulamanın genel görünümünü ve hissini tanımlar.

- **Yönlendirme**: 
  - Uygulama, splash ekranı, giriş ekranı ve ana ekran arasında geçiş yapmak için yönlendirmeler tanımlar. Bu, kullanıcıların uygulama içinde kolayca hareket etmelerini sağlar.

## Kullanıcı Deneyimi

Uygulama, kullanıcı deneyimini ön planda tutarak tasarlanmıştır. Splash ekranı, kullanıcıya hoş bir karşılama sunarken, giriş ekranı basit ve anlaşılırdır. Kullanıcılar, yalnızca Google hesaplarıyla hızlı bir şekilde giriş yaparak ana ekrana ulaşabilirler.


Uygulamanı GitHub'a yüklediğinde, insanların kendi bilgisayarlarında çalıştırabilmesi için bir **kurulum ve çalıştırma kılavuzu** eklemen gerekiyor. Bunun için **README.md** dosyasına aşağıdaki adımları ekleyebilirsin:  

## Kurulum

## 🚀 Tabii Clone App - Kurulum ve Çalıştırma Rehberi  

Bu proje, **Flutter** kullanılarak geliştirilen Tabii platformunun bir klonudur. Firebase ile entegre edilmiştir ve Google Girişi özelliğini destekler.  

### 📥 Projeyi İndirme ve Çalıştırma  

1️⃣ **Flutter'ı ve Gerekli Araçları Kur**  
- Flutter SDK'yı indir: [Flutter Kurulumu](https://flutter.dev/docs/get-started/install)  
- Android Studio veya Visual Studio Code kullanarak Flutter geliştirme ortamını hazırla.  

2️⃣ **Projeyi Klonla**  
GitHub deposunu kendi bilgisayarına çekmek için aşağıdaki komutu çalıştır:  

```sh
git clone https://github.com/KullanıcıAdın/Tabii-Clone-App.git
```

Daha sonra proje klasörüne gir:  

```sh
cd Tabii-Clone-App
```

3️⃣ **Bağımlılıkları Yükle**  
Projedeki tüm bağımlılıkları yüklemek için şu komutu çalıştır:  

```sh
flutter pub get
```

4️⃣ **Firebase Yapılandırması**  
Uygulamanın çalışması için Firebase yapılandırmasını yapman gerekiyor:  
- [Firebase Console](https://console.firebase.google.com/) adresinden bir proje oluştur.  
- **google-services.json** (Android için) ve **GoogleService-Info.plist** (iOS için) dosyalarını projeye ekle.  

5️⃣ **Uygulamayı Çalıştır**  
Şu komutu kullanarak uygulamayı çalıştırabilirsin:  

```sh
flutter run
```

✅ **Tebrikler!** Uygulama artık çalışıyor.  

---

Bu **README.md** dosyasını projenin kök dizinine eklediğinde, insanlar projeyi indirdiklerinde nasıl çalıştıracaklarını kolayca öğrenebilirler. Eğer Firebase entegrasyonu olmadan da çalıştırılabilmesini istiyorsan, **Firebase'siz bir demo sürümünü** de ekleyebilirsin.
