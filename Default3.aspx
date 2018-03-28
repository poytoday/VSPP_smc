<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default3.aspx.vb" Inherits="Default3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
html{
	padding:0px;
	margin:0px;
}
div#map_canvas{
	margin:auto;
	width:500px;
	height:450px;
	overflow:hidden;
}
</style>

</head>

<body> 
<p id="location">Current Location</p> 
<button onclick="getlocation()">Get</button> 
<div id="map1"></div> 
<script src="http://maps.google.com/maps/api/js?sensor=false"></script> 
<script type="text/javascript"> 
var p1=document.getElementById("location"); 
function getlocation() 
{ 
  if(navigator.geolocation) 
  { 
  navigator.geolocation.getCurrentPosition(showPosition,showError); 
  } 
  else
  { 
  p1.innerHTML="Location not Support"; 
  } 
} 
function showPosition(position) 
{ 
  
var lat=position.coords.latitude; 
var lon=position.coords.longitude; 
var ll=new google.maps.LatLng(lat,lon); 
var m1=document.getElementById("map1"); 
m1.style.height="250px"; 
m1.style.width="500px"; 
  
var opt={center:ll,zoom:14, 
    mapTypeId:google.maps.MapTypeId.ROADMAP, 
    mapTypeControl:false, 
    navigationControlOption:{ 
    style:google.maps.NavigationControlStyle.SMALL} 
    }; 
    var map=new google.maps.Map(document.getElementById("map1"),opt); 
    var marker=new google.maps.Marker({ 
    position:ll,map:map,title:"you are here"
    }); 
  
} 
function showError(error) 
{ 
  switch(error.code){ 
  case error.PERMISSION_DENIED: 
  p1.innerHTML="Permission Denied"; 
  break; 
    case error.TIMEOUT: 
  p1.innerHTML="Timeout"; 
  break; 
      case error.POSITION_UNAVALIABLE: 
  p1.innerHTML="No Position"; 
  break; 
        case error.UNKNOWN_ERROR: 
  p1.innerHTML="UNKNOWN"; 
  break; 
  } 
} 
</script> 
</body>