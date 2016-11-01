$(document).ready(function() {

    /*
     * ���㹺�ﳵ��ÿһ����Ʒ�еĽ��С��
     *
     * ���� row ���ﳵ����е���Ԫ��tr
     *
     */
    function getSubTotal(row) {
        var price = parseFloat($(row).find(".selling-price").data("bind"));
        var qty = parseInt($(row).find(":text").val());
        var result = price * qty;
        $(row).find(".selling-price").text($.formatMoney(price, 2));
        $(row).find(".subtotal").text($.formatMoney(result, 2)).data("bind", result.toFixed(2));
    };

    /*
     * ���㹺�ﳵ�в�Ʒ���ۼƽ��
     */
    function getTotal() {
        var qtyTotal = 0;
        var itemCount = 0;
        var priceTotal = 0;
        $(cartTable).find("tr:gt(0)").each(function() {
            getSubTotal(this);
            if ($(this).find(":checkbox").prop("checked") == true) {
                itemCount++;
                qtyTotal += parseInt($(this).find(":text").val());
                priceTotal += parseFloat($(this).find(".subtotal").data("bind"));
            }
        });
        $("#itemCount").text(itemCount).data("bind", itemCount);
        $("#qtyCount").text(qtyTotal).data("bind", qtyTotal);
        $("#priceTotal").text($.formatMoney(priceTotal, 2)).data("bind", priceTotal.toFixed(2));
    };

    var cartTable = $("#cartTable");

    getTotal();

    //Ϊÿһ����ѡ��ָ�������¼�
    $(cartTable).find(":checkbox").click(function() {
        //ȫѡ�򵥻�
        if ($(this).hasClass("check-all")) {
            var checked = $(this).prop("checked");
            $(cartTable).find(".check-one").prop("checked", checked);
        }

        //����ֹ�һ��һ���ĵ�ѡ�����й�ѡ����Ҫ�Զ�����ȫѡ�����ϻ���ȡ��
        var items = cartTable.find("tr:gt(0)");
        $(cartTable).find(".check-all").prop("checked", items.find(":checkbox:checked").length == items.length);
        //���ý��㰴ťdisabled����
        $("#btn_settlement").attr("disabled", items.find(":checkbox:checked").length == 0);

        getTotal();
    });

    //Ϊ���������ģ� �����ṩ�����¼��������¼����ƷС��
    /*
     * Ϊ���ﳵ��ÿһ�а󶨵����¼����Լ�ÿ���е������󶨼����¼�
     * ���ݴ����¼���Ԫ��ִ�в�ͬ����
     *   ��������
     *   ��������
     *   ɾ����Ʒ
     *
     */
    $(cartTable).find("tr:gt(0)").each(function() {
        var input = $(this).find(":text");
        
        //Ϊ�������������¼���������С�ƣ��������ܼ�
        $(input).keyup(function() {
            var val = parseInt($(this).val());
            if (isNaN(val) || (val < 1)) { $(this).val("1"); }
            getSubTotal($(this).parent().parent()); //tr element
            getTotal();
        });

        //Ϊ����������ť��ɾ����ӵ����¼���������С�ƣ��������ܼ�
        $(this).click(function() {
            var val = parseInt($(input).val());
            if (isNaN(val) || (val < 1)) { val = 1; }

            if ($(window.event.srcElement).hasClass("minus")) {
                if (val > 1) val--;
                input.val(val);
                getSubTotal(this);
            }
            else if ($(window.event.srcElement).hasClass("plus")) {
                if (val < 9999) val++;
                input.val(val);
                getSubTotal(this);
            }
            else if ($(window.event.srcElement).hasClass("delete")) {
                if (confirm("ȷ��Ҫ�ӹ��ﳵ��ɾ���˲�Ʒ��")) {
                    $(this).remove();
                }
            }
            getTotal();
        });
    });
});