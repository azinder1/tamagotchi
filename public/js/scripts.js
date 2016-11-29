$(function(){
 getUpdate();
    function getUpdate(){
      $('body').load('/');
      setTimeout(getUpdate, 1000)
    }
})
