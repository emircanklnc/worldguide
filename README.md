🌍 Country App – Flutter



Bu proje, Flutter kullanılarak geliştirilmiş;

ülkeleri, bölgeleri ve popüler ülkeleri listeleyen, aynı zamanda Gemini AI destekli chatbot içeren bir mobil uygulamadır.



Projenin temel amacı:



Flutter mimarisini doğru öğrenmek



View / ViewModel ayrımını kavramak



API entegrasyonu ve state yönetimi pratiği yapmak



Gerçek bir uygulama üzerinden kendimi geliştirmek



🚀 Özellikler



🌐 Ülkeleri Listeleme



REST Countries API kullanılarak ülkeler çekilir



Bayrak, ülke adı, başkent, nüfus gibi bilgiler gösterilir



🔍 Arama (Search)



Ülke adına göre canlı arama



Arama iptal edildiğinde ana ekrana dönüş



🗺️ Bölgelere Göre Filtreleme



Kıtaya / bölgeye göre ülke listeleme

⭐ Favori Ülkeler



Ülkeleri favorilere ekleme / çıkarma



Favori ülkelerin ayrı ekranda listelenmesi



Favori durumu UI üzerinde anlık güncellenir



🔥 Popüler Ülkeler



Belirli kriterlere göre (nüfus vb.) filtrelenmiş ülkeler



💬 Gemini AI Chatbot



Google Gemini API ile entegre



Kullanıcı mesajı → API → cevap akışı



Chat UI (sağ: kullanıcı, sol: bot)



Yeni mesaj geldiğinde otomatik aşağı kayma



🧠 Kullanılan Teknolojiler



Flutter (Dart)



HTTP – REST API istekleri



MVVM yaklaşımı (Provider’sız)



View → UI



ViewModel → iş mantığı



Model → veri yapıları



Google Gemini API



JSON Modelleme



Stateful Widget \& Controller mantığı



ScrollController ile Chat UX



🤖 Gemini AI Entegrasyonu



Google Gemini generateContent endpoint’i kullanıldı



Gelen response Model sınıfı ile parse edildi



ViewModel içinde mesaj yönetimi yapıldı



UI sadece veriyi çiziyor



Bu sayede:



API bağımlılığı UI’dan ayrıldı



Kod test edilebilir hale geldi



Gerçek MVVM mantığına yaklaşıldı

