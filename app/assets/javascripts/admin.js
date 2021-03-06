var $d = jQuery.noConflict();

$d(function() {
  // dropzonejs
  Dropzone.autoDiscover = false;

  function insertImageUrl(image) {
    var html = `<div hidden class="btn btn-primary imageurl" data-clipboard-text="${image.url}">Copy Link</div>`
    return html
  }
  //images_controller.rbのcreateアクションが呼ばれる
  $d('#my-dropzone').dropzone({
    maxFilesize: 200,// MB
    paramName: 'file_name[file_name]',
    clickable: true,
    success: function(file, response) {
      // file.previewElementでpreview要素のhtmlにアクセス
      $d(file.previewElement).addClass('dz-success');
      $d(file.previewElement).find('.dz-remove').hide();
      $d(file.previewElement).find('.dz-progress').hide();
      $d(file.previewElement).find('.dz-filename').find('span').text(response.url);

      // urlを埋め込んだ隠し要素を生成、埋め込み
      var imageUrl = insertImageUrl(response);
      $d(file.previewElement).append(imageUrl);
    },
    // init executed at first when Page loaded
    init: function() {
      //this equal dropzone
      var me = this;

      //call list function in images_controller.rb with get method
      $d.ajax({
        type: 'GET',
        url: "/admin/images",
        dataType: 'json',
        success: function(data){
          $d.each(data.images, function(key, value) {
            if (data.images != undefined && data.images.length > 0) {
              me.emit("addedfile", value);
              me.emit("thumbnail", value, value.thumb);
              me.emit("complete", value);
              $d(value.previewTemplate).attr("id", value.id);
              $d(value.previewTemplate).find('.dz-size').hide();
              $d(value.previewTemplate).find('.dz-filename').find('span').text(value.url);
              var imageUrl = insertImageUrl(value);
              $d(value.previewTemplate).append(imageUrl);
              $d(value._removeLink).hide();
            }
          });
        }
      });
    }
  });

  $d(document).on("click", ".imageurl", function(){
    var url = $d(this).data('clipboard-text');
    console.log(url);
  });

});
