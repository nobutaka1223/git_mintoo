$(function() {
$(".treemenu  .category_color1 .lv1btn,.treemenu .category_color1 .lv1body .lv2btn,.treemenu .category_color1 .lv1body .lv2body .lv3btn"
  ".treemenu  .category_color2 .lv1btn,.treemenu .category_color2 .lv1body .lv2btn,.treemenu .category_color2 .lv1body .lv2body .lv3btn"
  ".treemenu  .category_color3 .lv1btn,.treemenu .category_color3 .lv1body .lv2btn,.treemenu .category_color3 .lv1body .lv2body .lv3btn"
  ".treemenu  .category_color4 .lv1btn,.treemenu .category_color4 .lv1body .lv2btn,.treemenu .category_color4 .lv1body .lv2body .lv3btn"


).click(function() {
$(this).next().slideToggle(100);
});
});