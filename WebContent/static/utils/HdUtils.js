/**
 * Created by wuph on 2016-7-7.
 */
function HdUtils() {
}
/**
 * 验证手机号码
 * @param {type} mobile
 * @returns {Boolean}
 * @author wuph
 */
HdUtils.validator = {};
HdUtils.validator.mobile = function (mobile) {
    if ((/^1[3|4|5|7|8][0-9]\d{4,8}$/.test(mobile))) {
        return true;
    } else {
        return false;
    }
};
/**
 * 日期格式化
 * @param fmt
 * @returns {*}
 */
Date.prototype.format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};