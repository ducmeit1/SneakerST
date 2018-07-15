$(function () {
    $(window).bind("load resize", function () {
        var topOffset = 50;
        var width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('div.navbar-collapse').addClass('collapse');
            topOffset = 100; // 2-row-menu
        } else {
            $('div.navbar-collapse').removeClass('collapse');
        }

        var height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
        height = height - topOffset;
        if (height < 1)
            height = 1;
        if (height > topOffset) {
            $("#page-wrapper").css("min-height", (height) + "px");
        }
    });

    var url = window.location;
    // var element = $('ul.nav a').filter(function() {
    //     return this.href == url;
    // }).addClass('active').parent().parent().addClass('in').parent();
    var element = $('ul.nav a').filter(function () {
        return this.href == url;
    }).addClass('active').parent();

    while (true) {
        if (element.is('li')) {
            element = element.parent().addClass('in').parent();
        } else {
            break;
        }
    }
});
$(document).ready(function () {
    $('#dataTables-example').DataTable({
        responsive: true
    });
});

$(function() {
    $('#side-menu').metisMenu();
});

$(document).ready(function() {
    var max_fields      = 10; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field"); //Add button ID
    
    var x = 0; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
         if(x < max_fields){  //max input box allowed
            $(wrapper).append(// onkeyup="onInputKeyUp(event)"
            '<div><input class="form-control" name="product_image_url" type="text" style="margin-top: 15px"><a href="#" class="remove_field"><i class="fa fa-close fa-fw"></i></a></div>'); //add input box
            x++; //text box increment
        }
    });
    
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
    });
});

$(document).ready(function () {
   $("select[name=product_instock]").on('change', function () {
        if ($(this).val() === "Out Stock") {
            $(".sizestock").val(0);
        }
    });
});

$(document).ready(function() {
    var max_category    = 1; //maximum input boxes allowed
    var wrapper         = $(".wrap_category"); //Fields wrapper
    var add_button      = $(".add_category"); //Add button ID
    
    var x = 0; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
         if(x < max_category){  //max input box allowed
            $(wrapper).append(// onkeyup="onInputKeyUp(event)"
            '<tr><td><input type="number" name="category_id" class="category_input"></td><td><input type="text" name="category_name" class="category_input"></td><td><a href="category?action=add" class="btn btn-default">Add Category</a></td></tr>'); //add input box
            x++; //text box increment
        $(".add_category").remove();
        }
    });
});
