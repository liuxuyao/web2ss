/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//count 总记录数 rowspage 每页显示的记录数 pageindex 当前页数
function setPage(total, rowspage, pageindex, pageId) {
    var container;
    if (pageId) {
        container = document.getElementById(pageId);
    } else {
        container = document.getElementById("page");
    }
    // 默认每页显示20条
    if (typeof (rowspage) == "undefined" || rowspage == 0) {
        rowspage = 20;
    }
    // 页数
    var count = 1;
    if (typeof (total) == "undefined" || total == 0) {
    } else {
        count = Math.ceil(total / rowspage);
    }
    if (typeof (pageindex) == "undefined" || pageindex == 0) {
        pageindex = 1;
    }
    var pageindex = pageindex;
    var a = [];
    //总页数少于10 全部显示,大于10 显示前3 后3 中间3 其余....
    if (pageindex == 1) {
        a[a.length] = "<a href=\"#\" class=\"prev unclick\" style='color:#A3A3A3;'>[上一页]</a>";
    } else {
        a[a.length] = "<a href=\"#\" class=\"prev\">[上一页]</a>";
    }
    function setPageList(i) {
        if (pageindex == i) {
            a[a.length] = "<a href=\"#\" class=\"a-first\">[" + i + "]</a>";
        } else {
            a[a.length] = "<a href=\"#\">[" + i + "]</a>";
        }
    }

    //总页数小于10
    if (count <= 10) {
        for (var i = 1; i <= count; i++) {
            setPageList(i);
        }
    }
    //总页数大于10页
    else {
        if (pageindex <= 4) {
            for (var i = 1; i <= 5; i++) {
                setPageList(i);
            }
            a[a.length] = "...<a href=\"#\">[" + count + "]</a>";
        } else if (pageindex >= count - 3) {
            a[a.length] = "<a href=\"#\">[1]</a>...";
            for (var i = count - 4; i <= count; i++) {
                setPageList(i);
            }
        }
        else { //当前页在中间部分
            a[a.length] = "<a href=\"#\">[1]</a>...";
            for (var i = pageindex - 2; i <= pageindex + 2; i++) {
                setPageList(i);
            }
            a[a.length] = "...<a href=\"#\">[" + count + "]</a>";
        }
    }
    if (pageindex == count) {
        a[a.length] = "<a href=\"#\" class=\"next unclick\" style='color:#A3A3A3;'>[下一页]</a>";
    } else {
        a[a.length] = "<a href=\"#\" class=\"next\">[下一页]</a>";
    }
    container.innerHTML = a.join("");
    //事件点击
    var pageClick = function () {
        var oAlink = container.getElementsByTagName("a");
        var inx = pageindex; //初始的页码
        oAlink[0].onclick = function () { //点击上一页
            if (inx == 1) {
                return false;
            }
            inx--;
            //setPage(container, count, inx);
            query(inx, pageId);
            return false;
        }
        for (var i = 1; i < oAlink.length - 1; i++) { //点击页码
            oAlink[i].onclick = function () {
                // 提取字符串中的数字
                var value = this.innerHTML.replace(/[^0-9]/ig, "");
                inx = parseInt(value);
                //setPage(container, count, inx);
                query(inx, pageId);
                return false;
            }
        }
        oAlink[oAlink.length - 1].onclick = function () { //点击下一页
            if (inx == count) {
                return false;
            }
            inx++;
            //setPage(container, count, inx);
            query(inx, pageId);
            return false;
        }
    }()
}

