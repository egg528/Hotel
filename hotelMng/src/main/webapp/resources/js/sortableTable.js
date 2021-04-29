/**
 * sortable.js 
 * sortable Table 
 * @version 1.0
 * @author SAINTSHINE
 * @since 2012.11.06
 */
(function($) {
 
    jQuery.fn.sortableTable = function(option) {
 
        // current table
        var $table = $(this);
 
        // optinos
        var activeColor = '';
 
        var sort_classes = Array();
        sort_classes.push("sort-numeric");
        sort_classes.push("sort-text");
        sort_classes.push("sort-date");
         
         
        if (option) {
            if (option.activeColor) {
                activeColor = option.activeColor;
            }    
        }
 
        var $sort_asc = "<span class='sortable-arrow ui-icon ui-icon-triangle-1-n' style='float: right;'></span>";
        var $sort_desc = "<span class='sortable-arrow ui-icon ui-icon-triangle-1-s' style='float: right;'></span>";
 
        var arrow = {
            "1" : $sort_asc,
            "-1": $sort_desc
        };
 
 
        $table.each(function(index) {        
     
            $('th', $table).each(function(column) {
 
                var $header = $(this);
 
                if (hasSortClass($header)) {
           
                    $header.sortDirection = 1;
                    $header.css('cursor', 'pointer');
                     
                     
     
                    $header.click(function() {
                         
                        clearHeader();
                         
                        activeCurrentHeader($header);
                         
                        var rows = $table.find('tbody > tr').get();
                        setSortKey($header, rows, column);
                        rows.sort(function(pre, curr) {
                            // var keyA = $(a).children('td').eq(column).text();
                            // var keyB = $(b).children('td').eq(column).text();
 
 
                            if (pre.sortKey < curr.sortKey) {
                                return -$header.sortDirection;  
                            }
                            if (pre.sortKey > curr.sortKey) {
                                return $header.sortDirection;
                            }
                            return 0;
                        });
     
                        $header.sortDirection = -$header.sortDirection;
                        // $table.children('tbody').empty();
     
                        $.each(rows, function(index, row) {                        
                            $table.children('tbody').append(row);
                        });
                    });
                }
            });     
        });
 
        function hasSortClass(obj) {
            var result = false;
            $.each(sort_classes, function(index, cls) {                
                if (obj.hasClass(cls)) {
                    result = true;
                }
            });
            return result;
        };
 
        function clearHeader() {
            $('th', $table).each(function() {
                $(this).css('background', '');
                $(this).find('.sortable-arrow').remove();
            });
        }
 
        function activeCurrentHeader(obj) {
            obj.html(obj.html() + arrow[obj.sortDirection]);
            obj.css("background", activeColor);
        }
         
        function setSortKey(obj, rows, column) {
 
            $.each(rows, function(index, row) {
                var key = $(row).children('td').eq(column).text();
 
                //console.log(key);
 
                if (obj.hasClass('sort-numeric')) {
                     
                    key = parseFloat(key);
                    key = isNaN(key) ? 0 : key;
 
                }
 
                row.sortKey = key;
 
            });
        }
    };
})(jQuery);
