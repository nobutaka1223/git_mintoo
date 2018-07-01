window.onload = function(){
  
 
  // ];
  var images = [
  ["/images/top (1).jpg", 'これは1枚目の画像'],
  ["/images/top (2).jpg", 'これは2枚目の画像'],
  ["/images/top (3).jpg", 'これは3枚目の画像'],
  ["/images/top (4).jpg", 'これは4枚目の画像'],
  ["/images/top (5).jpg", 'これは5枚目の画像'],
  ["/images/top (6).jpg", 'これは6枚目の画像'],
  ["/images/top (7).jpg", 'これは7枚目の画像'],
  ["/images/top (8).jpg", 'これは8枚目の画像'],
  ["/images/top (9).jpg", 'これは9枚目の画像'],
  ["/images/top (10).jpg", 'これは10枚目の画像'],
  ["/images/top (11).jpg", 'これは11枚目の画像'],
  ["/images/top (12).jpg", 'これは12枚目の画像'],
  ["/images/top (13).jpg", 'これは13枚目の画像']
];
var randImg = images[Math.floor(Math.random() * images.length)];
$('.header__bar').css({'background-image': 'url(randImg[0])' });
}