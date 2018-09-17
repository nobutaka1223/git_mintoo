$(window).on('load', function(){
  
 
  // ];
  var images = [
  ['url("/images/top (1).jpg")'],
  ['url("/images/top (2).jpg")'],
  ['url("/images/top (3).jpg")'],
  ['url("/images/top (4).jpg")'],
  ['url("/images/top (5).jpg")'],
  ['url("/images/top (6).jpg")'],
  ['url("/images/top (7).jpg")'],
  ['url("/images/top (8).jpg")'],
  ['url("/images/top (9).jpg")'],
  ['url("/images/top (10).jpg")'],
  ['url("/images/top (11).jpg")'],
  ['url("/images/top (12).jpg")'],
  ['url("/images/top (13).jpg")']
];

// ＄の配列を式展開させればうまくいった、上手くググるのがポイント`を忘れずに
var randImg = images[Math.floor(Math.random() * images.length)]
$('.header').css({'background-image':`${randImg[0]}`});
});