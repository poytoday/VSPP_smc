<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default4.aspx.vb" Inherits="Default4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <style type="text/css">
		<!--
		h1 {
			font-family:sans-serif;
			color:blue;
			text-align: center;
			font-size:120%;
		}

		.tekst {
			font-family:sans-serif;
			color:blue;
			font-size:100%;
		}

		.smalltekst {
			font-family:sans-serif;
			color:black;
			font-size:80%;
		}
		-->	
		</style>
    <style type="text/css">
		v\:* {
			behavior:url(#default#VML);
		}
		</style>

    <script src="http://maps.google.com/maps?file=api&v=2&key=ABQIAAAAF4PVqw0p5l92pEmE39k0MRQWxhPw7-SAnMb84NfHs4vQ3HTp4BTb-yeL6fQg7Up9d9idBGy5naXydw"
        type="text/javascript"></script>

    <title>Google Maps Latitude, Longitude Popup</title>
</head>
<body>
    <h1>
        lGoogle Maps Latitude, Longitude Popup</h1>
    <div style="width: 600px;" class="tekst">
        <b>Simply click on the map on a location and it will provide you with the latitude and
            longitude in the callout window.</b></div>
    <div id="map" style="width: 600px; height: 400px">
    </div>
    <div id="geo" style="width: 300px; position: absolute; left: 616px; top: 104px;"
        class="tekst">
        <form name="setLatLon" action="Default4.aspx">
            <b>* Coordinates:</b><br />
            <table>
                <tr>
                    <td>
                        * Lat:</td>
                    <td>
                        <input type='text' name='lat' id="frmLat"></td>
                </tr>
                <tr>
                    <td>
                        * Lon:</td>
                    <td>
                        <input type='text' name='lon' id="frmLon"></td>
                </tr>
            </table>
            <input type="submit" name="setLatLon" value="Set" id="Submit1" onclick="return Submit1_onclick()"><br />
        </form>
        <br />
        <b>* Flickr tags:</b><br />
        <textarea id="geocode" cols="30" rows="2"></textarea><br />
        <br />
        <b>* RoboGEO tags:</b><br />
        <textarea id="geocodeRoboGEO" cols="30" rows="2"></textarea><br />
        * <a href="#" target="_blank" id="multimap">Show location on Multimap</a><br />
        * <a href="#" id="maplink">Permanent Link</a><br />
        <br />

        <script type="text/javascript">
		<!--
		google_ad_client = "pub-1588116269263536";
		google_alternate_color = "FFFFFF";
		google_ad_width = 234;
		google_ad_height = 60;
		google_ad_format = "234x60_as";
		google_ad_type = "text";
		//2006-09-30: Map
		google_ad_channel ="0993881556";
		google_color_border = "DDDDDD";
		google_color_bg = "DDDDDD";
		google_color_link = "0000FF";
		google_color_text = "333333";
		google_color_url = "333333";
		//-->
        </script>

        <script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>

    </div>
    <div style="width: 600px;" class="smalltekst">
        <p>
            <i>Address lookup has been removed because it violated the ToS of Google Maps.</i></p>
        Based on code taken from <a href="http://conversationswithmyself.com/googleMapDemo.html">
            this website</a> and <a href="http://www.evolt.org/article/Javascript_to_Parse_URLs_in_the_Browser/17/14435/?format=print">
                this website</a>.<br />
        All other errors are caused by code written by <a href="http://www.gorissen.info/Pierre/">
            Pierre Gorissen</a>.<br />
    </div>

    <script type="text/javascript">
    //<![CDATA[


	var baseLink = "http://www.gorissen.info/Pierre/maps/googleMapLocation.php";
	var multimapBaseLink = "http://www.multimap.com/map/browse.cgi?scale=10000&icon=x";
	var geocoder = new GClientGeocoder();
	var setLat = 14.798783;
	var setLon = 100.652790;   

//function Load_map()
//{
//initialize(,)

//}
	// argItems code taken from 
	// http://www.evolt.org/article/Javascript_to_Parse_URLs_in_the_Browser/17/14435/?format=print
	function argItems (theArgName) {
		sArgs = location.search.slice(1).split('&');
    		r = '';
    		for (var i = 0; i < sArgs.length; i++) {
        		if (sArgs[i].slice(0,sArgs[i].indexOf('=')) == theArgName) {
            			r = sArgs[i].slice(sArgs[i].indexOf('=')+1);
            			break;
        		}
    		}
    	return (r.length > 0 ? unescape(r).split(',') : '')
	}
	
	
	function getCoordForAddress(response) {
	
		if (!response || response.Status.code != 200) {
	        alert("Sorry, we were unable to geocode that address\n\n Sorry, dat adres bestaat blijkbaar niet!");
	    } else {
			place = response.Placemark[0];
			setLat = place.Point.coordinates[1];
			setLon = place.Point.coordinates[0];
			setLat = setLat.toFixed(6);
			setLon = setLon.toFixed(6);
			document.getElementById("frmLat").value = setLat;
			document.getElementById("frmLon").value = setLon;
		}
		placeMarker(setLat, setLon)
    }
	
	
	function placeMarker(setLat, setLon) {
	    var message = "geotagged geo:lat=" + setLat + " geo:lon=" + setLon + "poytoday"; 
		document.getElementById("geocode").value = message;
		var messageRoboGEO = setLat + ";" + setLon + "poytoday2"; 
		document.getElementById("geocodeRoboGEO").value = messageRoboGEO;
	    
		document.getElementById("geocode").focus();
		document.getElementById("geocode").select();

		document.getElementById("maplink").href = baseLink + "?lat=" + setLat + "&lon=" + setLon ;
		document.getElementById("multimap").href = multimapBaseLink + "&lat=" + setLat + "&lon=" + setLon ;
		document.getElementById("frmLat").value = setLat;
		document.getElementById("frmLon").value = setLon;
	
		var map = new GMap(document.getElementById("map"));
		
		map.addControl(new GSmallMapControl()); // added
		map.addControl(new GMapTypeControl()); // added
		map.centerAndZoom(new GPoint(setLon, setLat), 5);
		
		var point = new GPoint(setLon, setLat);
		var marker = new GMarker(point);
		map.addOverlay(marker);

		GEvent.addListener(map, 'click', function(overlay, point) {
			if (overlay) {
				map.removeOverlay(overlay);
			} else if (point) {
				map.recenterOrPanToLatLng(point);
				var marker = new GMarker(point);
				map.addOverlay(marker);
				var matchll = /\(([-.\d]*), ([-.\d]*)/.exec( point );
				if ( matchll ) { 
					var lat = parseFloat( matchll[1] );
					var lon = parseFloat( matchll[2] );
					lat = lat.toFixed(6);
					lon = lon.toFixed(6);
					var message = "geotagged geo:lat=" + lat + " geo:lon=" + lon + "poytoday3"; 
					var messageRoboGEO = lat + ";" + lon + "poytoday3"; 
				} else { 
					var message = "<b>Error extracting info from</b>:" + point + ""; 
					var messagRoboGEO = message;
				}

				marker.openInfoWindowHtml(message);
				document.getElementById("geocode").value = message;
				document.getElementById("geocodeRoboGEO").value = messageRoboGEO;
				document.getElementById("geocode").focus();
				document.getElementById("geocode").select();

				document.getElementById("maplink").href = baseLink + "?lat=" + lat + "&lon=" + lon ;
				document.getElementById("multimap").href = multimapBaseLink + "&lat=" + lat + "&lon=" + lon ;
				document.getElementById("frmLat").value = lat;
				document.getElementById("frmLon").value = lon;

			}
			
		});marker.openInfoWindowHtml(message);
	}

	function findAddress() {
		myAddress = document.getElementById("address").value;
		geocoder.getLocations(myAddress, getCoordForAddress);
	
	}


	if (argItems("lat") == '' || argItems("lon") == '') {
		placeMarker(setLat, setLon);
    } else {
		var setLat = parseFloat( argItems("lat") );
		var setLon = parseFloat( argItems("lon") );
		setLat = setLat.toFixed(6);
	    setLon = setLon.toFixed(6);
		placeMarker(setLat, setLon);
    }

    //]]>
    </script>

    <!-- Start twatch code -->

    <script type="text/javascript"><!--
//<![CDATA[
document.write('<scr'+'ipt type="text/javascript" src="/Pierre/twatch/jslogger.php?ref='+( document["referrer"]==null?'':escape(document.referrer))+'&pg='+escape(window.location)+'&cparams=true"></scr'+'ipt>');
//]]>
function Submit1_onclick() {

}

//--></script>

    <!-- End twatch code -->
</body>
</html>
