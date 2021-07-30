


function doLike(uId, pId){
  console.log(uId+" "+pId);
  
  const d ={
  uId : uId,
  pId : pId,
  operation : 'like'}
  
    
  $.ajax({
  
  url : 'LikeServlet',
  type : 'POST',
  data : d,
  success : function(data, textStatus, jqXHR){
   console.log(data);
   if(data.trim()=="true"){
   
   let c = $(".like-counter").html();
   c++;
   $(".like-counter").html(c);
   }
  },
  error : function(jqXHR, textStatus, errorThrown){
    console.log("error");
  }
  
  
  });
  

  
}