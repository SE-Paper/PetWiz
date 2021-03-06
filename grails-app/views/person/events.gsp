<%@ page import="petwiz_project.Person" %>
<!DOCTYPE html>
<html>
<head>
    <title>Petwiz: Eventos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="layout" content="main" />
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <asset:stylesheet src="test.css"/>
    <asset:javascript src="geocodification.js"/>
</head>

<body onload="initialize()">
<main>
    <script type = "text/javascript">
        var _url = '${createLink(controller: 'index' , action:'logout')}?';
        var itemId=1;
        var getAddresses = function(){
            var addresses = [];
            $(".listElement").each(function() {
                var splited = $("p", this).text().split("\n");
                addresses.push(splited[1].trim());
            });
            return addresses;
        }
        var setPhoto = function(photo){
            document.getElementById("#avatar").src = "data:image/jpg;base64," + photo;
        }
        var setEventId = function(id){
            itemId=id;
        }
        var getChecked = function(){
            var ids =[];
            var $boxes = $('input:checked');
            var str = "["
            $boxes.each(function(){
                str+=($(this).attr('id'))+",";
            });
            str = str.slice(0, -1);
            str+="]";
            window.location.href= '${createLink(controller: 'person' , action:'addPetToEvent')}?params='
                    + [str,itemId];
        }
        var countChecked = function () {
            var n = $( "input:checked" ).length;
            if(n>0){
                $("#add").addClass("modal-action");
                $("#add").addClass("modal-close");
                $("#add").addClass("waves-effect");
                $("#add").addClass("waves-green");
                $("#add").removeClass("disabled");
            }
            else{
                $("#add").removeClass("modal-action");
                $("#add").removeClass("modal-close");
                $("#add").removeClass("waves-effect");
                $("#add").removeClass("waves-green");
                $("#add").addClass("disabled");
            }
        }
        $(document).ready(function(){
            $(".listElement").click(function(){

                var splited = $("p", this).text().split("\n");
                console.log(splited[1].trim());
                if($(".brtt", this).css("display")=="none"){
                    deleteMarkers();
                    codeAddress(splited[1].trim(), 1);
                    $(".brtt").css("display", "none");
                    $(".brtt", this).css("display", "inline-block");
                    $(".brtt", this).hide();
                    $(".brtt", this).show();
                }else{
                    $(".brtt", this).hide();
                    $(".brtt", this).css("display", "none");
                    reset();
                }
            });
            $( "input[type=checkbox]" ).on( "click", countChecked );
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('.collapsible').collapsible();
        });
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?callback=initialize"
            async defer></script>

    <div class="row">

            <div class="col s12 m6 l6">
                <div id="events">
                    <ul class="collection collapsible" data-collapsible="accordion">
                        <g:set var="idEvent" value="1" />
                        <g:each  var="item" in="${petwiz_project.Event?.list()}">
                            <input id="event_id" type="hidden" class="validate "  value="${item.id}" name="id" >
                            <li>
                                <div class="collapsible-header collection-item avatar listElement">
                                    <i class="material-icons circle">folder</i>
                                    <h5 class="bold">${item.eve_name}</h5>
                                    <p> ${item.dateFormat()}<br>
                                        ${item.eve_address}
                                    </p>
                                    <p>
                                        <g:if test="${item.pets.size() > 0}">
                                            ${item.pets.size()} Mascota(s) asistirán!!
                                        </g:if>
                                    </p>
                                    <a class="btn-floating blue modal-trigger darken-1 brtt tooltipped modal-trigger" data-position="top" href="#addPetToEvent" data-tooltip="Agregar mascota" id="addToEvent" onclick="setEventId(${item.id});"><i class="material-icons">add</i></a>
                                </div>
                                <div class="collapsible-body" id="description"><p>${item.eve_description}</p></div>
                            </li>
                        </g:each>
                    </ul>
                </div>
            </div>

            <div class="col s12 m6 l5">
                <!--<div id="emap"></div>-->
                <div id="map-responsive" class="padding-google"></div>
            </div>

    </div>

    <div class="col s12 m6 l8 offset-m6 l8">
        <div id="addPetToEvent" class="modal small modal-fixed-footer">
            <div class="modal-content">
                <h4>Agregar mascotas</h4>
                <p>Selecciona de tus mascotas cuales participarán del evento</p>
                <ul class="collection">
                    <g:each  var="item" in="${petwiz_project.Pet?.findAllByPerson(Person.findByUsername(session["user"]))}">
                        <li class="collection-item avatar">
                            <div>
                                <img src="${createLink(controller:'person', action:'showAvatarPet', id:item.id)}" alt="" class="circle">
                                <span class="title">${item.name}</span>
                                <p> ${item.type}<br>
                                    ${item.genre}<br>
                                    ${item.getBday()}<br>
                                    ${item.age} Años
                                </p>
                                <div>
                                    <input class="thecheck" type="checkbox" id=${item.id} />
                                    <label for=${item.id} class="check"></label>
                                </div>
                            </div>
                        </li>
                    </g:each>
                </ul>
            </div>
            <div class="modal-footer">
                <a class="btn-flat disabled" onClick="getChecked();" id="add">Agregar</a>
                <a href="#!" class="modal-action modal-close waves-effect waves-red btn-flat ">Cancelar</a>
            </div>
        </div>
    </div>
</main>
</body>
</html>