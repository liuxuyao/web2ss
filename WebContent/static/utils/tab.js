// 数组来存储我们的标签id
var tabs = [];
// 索引数组
var ind = 0;
// 定时器
var inter;
// 改变当前选项卡_标题选项卡并突出
function change(stringref) {
    // 隐藏其他标签
    $('.tab:not(#' + stringref + ')').hide();
    // 显示正确的标签,IE6 bug
    $('.tab#' + stringref).fadeIn();
    // 从先前的选项卡标题明显突出
    $('.htabs a:not(a[href=#' + stringref + '])').parent().removeClass('li-first');
    $('.htabs a[href=#' + stringref + ']').parent().addClass('li-first');
    if (typeof(flag) != "undefined") {
        flag = stringref;
    }
    query();
}
function next() {
    // 改变显示下一个选项卡
    change(tabs[ind++]);
    // 如果是最后一个选项卡,明确该指数
    if (ind >= tabs.length)
        ind = 0;
}
$(document).ready(function () {
    // 所有的标签都存储在数组中
    $(".tab").map(function () {
        tabs[ind++] = $(this).attr("id");
    })
    // 设置索引的下一个元素
    ind = 1;
    // 初始化标签,显示当前选项卡
    $(".tab:not(:first)").hide();
    $(".tab:first").show();
    // 突出当前选项卡标题
    $('#' + tabs[0] + 't').addClass('select');
    // 处理程序点击选项卡
    $(".htabs a").click(function () {
        // 如果点击选项卡,停止旋转
        clearInterval(inter);
        // 点击存储引用选项卡
        stringref = $(this).attr("href").split('#')[1];
        // 显示引用选项卡
        change(stringref);
        // 开始旋转选项卡
        //inter = setInterval("next()", 6000);
        return false;
    });
    // 开始旋转选项卡
    //inter = setInterval("next()", 6000);
});