<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ui="ui" xmlns:e="entity" xmlns:xhtml="xhtml" xmlns:page="page" xmlns:exslt="http://exslt.org/common" exclude-result-prefixes="exslt page e ui html xhtml">


    <xsl:template match="ui:menu">


        <h3 class="uppercase">Операции</h3>


        <!--ul class="menu">
            <li class="selected">

                <input type="radio" id="ux-menu" name="ux-menu"/>
                <label for="ux-menu">Menu 1</label>
         
                <ul>
                    <li>
                        <input type="checkbox" id="sub-group-1"/>
                        <label for="sub-group-1">Submenu 1</label>
                        <ul>
                            <li><a href="#">Sub Item</a></li>
                            <li><a href="#">Sub Item</a></li>
                            <li><a href="#">Sub Item</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Menu Item</a></li>
                    <li><a href="#">Menu Item</a></li>
                </ul>
            </li>
         
            <li><a href="#">Item</a></li>
            <li>
                <input type="radio" id="ux-menu1" name="ux-menu"/>
                <label for="ux-menu1">Menu 2</label>
         
                <ul>
                    <li>
                        <input type="checkbox" id="sub-group-2"/>
                        <label for="sub-group-2">Submenu 2</label>
                        <ul>
                            <li><a href="#">Sub Item</a></li>
                            <li><a href="#">Sub Item</a></li>
                            <li><a href="#">Sub Item</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Menu Item</a></li>
                    <li><a href="#">Menu Item</a></li>
                </ul></li>
        </ul-->

       <ul class="menu">
                
            <li class="selected">
                
                <input type="radio" id="ux-menu-ACCEPT" name="ux-menu"/>
                <label for="ux-menu-ACCEPT" href="#/registration/service"><i class="icon-arrow-down"></i>Прием</label>

                <ul>
                    <li><a href="service.xhtml" hrez="#/service/P203" badge="9">Посылка</a></li>
                    <li><a href="#/service/P201">Письмо</a></li>
                    <li><a href="#/service/T103">КГПО</a></li>
                    <li><h4>СНГ/ДЗ</h4></li>
                    <li><a href="#/service/P203">Посылка</a></li>
                    <li><a href="#/service/P201">Письмо</a></li>
                    <li><a href="#/service/P207">Мешок "М"</a></li>
                    <li><h4>EMS</h4></li>
                    <li><a href="#/service/P118">"Эконом доставка"</a></li>
                    <li><a href="#/service/P104">"Моя Страна"</a></li>
                    <li><a href="#/service/P113">"Приоритет-10"</a></li>
                    <li><a href="#/service/P114">"Приоритет-13"</a></li>
                    <li><a href="#/service/P115">"День в день"</a></li>
                    <li><a href="#/service/P117">"Доставка пешим курьером"</a></li>
                    <li><a href="#/service/P204">"Планета EMS"</a></li>
                    <li><a href="#/service/P213">"Планета Эспресс"</a></li>
                    <li><a href="#/service/P212">"Планета Экспресс РФ"</a></li>
                    <li></li>
                    <li><a href="#/service/other">Дополнительная услуга на сумму</a></li>
                </ul>

                <!--ul>
                        <li><a href="#/service/T103">КГПО РК</a></li>
                        <li><a href="#/service/P101">Письмо РК</a></li>
                        <li><a href="#/service/P102">Бандероль РК</a></li>
                        <li><a href="#/service/P103">Посылка РК</a></li>
                        <li></li>
                        <li><a href="#/service/P105">Почтовая карточка</a></li>
                        <li><a href="#/service/P205">Почтовая карточка СНГ/ДЗ</a></li>
                        <li><a href="#/service/P206">Мелкий пакет СНГ/ДЗ</a></li>
                        <li><a href="#/service/P207">Мешок "М" СНГ/ДЗ</a></li>
                        <li><a href="#/service/P108">P108 Секограмма РК</a></li>
                        <li><a href="#/service/P109">Посылка на постамат</a></li>
                        <li><a href="#/service/P122">Простое письмо с ШПИ</a></li>
                        <li><a href="#/service/P201">Письмо СНГ/ДЗ</a></li>
                        <li><a href="#/service/P202">Бандероль СНГ/ДЗ</a></li>
                        <li><a href="#/service/P203">Посылка СНГ/ДЗ</a></li>
                        <li></li>
                        <li><a href="#/service/P104">P104 EMS "Моя Страна" РК</a></li>
                        <li><a href="#/service/P113">P113 EMS "Приоритет-10"</a></li>
                        <li><a href="#/service/P114">P114 EMS "Приоритет-13"</a></li>
                        <li><a href="#/service/P115">P115 EMS "День в день"</a></li>
                        <li><a href="#/service/P117">P117 EMS "Доставка пешим курьером"</a></li>
                        <li><a href="#/service/P118">P118 EMS "Эконом доставка"</a></li>
                        <li><a href="#/service/P204">P204 EMS "Планета EMS" за пределы РК</a></li>
                        <li><a href="#/service/P212">P212 EMS "Планета Экспресс РФ"</a></li>
                        <li><a href="#/service/P213">P213 EMS "Планета Эспресс СНГ и ДЗ"</a></li>
                        <li><a href="#/service/P214">P214 IMPORT EMS</a></li>
                        <li></li>
                        <li><a href="#/service/other">Дополнительная услуга на сумму</a></li>
                </ul-->
            </li>

            <li>
                <input type="radio" id="ux-menu-SORT" name="ux-menu"/>
                <label for="ux-menu-SORT" href="#/transports/transport-arrival"><i class="icon-directions"></i>Сортировка</label>
                
                <ul>
                    <li><a href="#/transports/transport-arrival">   Прибытие транспорта</a></li>
                    <li><a href="#/transports/transport-send">      Отправка транспорта</a></li>
                    <li></li>
                    <li><a href="#/sorting/packet-lists/view-all">  Формирование заделки</a></li>
                    <li><a href="#/sorting/label-lists/view-all">   Формирование ярлыка</a></li>
                    <li><a href="#/sorting/destination-list">       Формирование DL/TL</a></li>
                    <li></li>
                    <li><a href="#/sorting/transfer-act">           Акты приема/передачи</a></li>
                    <li><a href="#/sorting/transport-list">         Список рейсов</a></li>
                </ul>
            </li>

            <li>
                <input type="radio" id="ux-menu-GIVE" name="ux-menu"/>
                <label for="ux-menu-GIVE" href="#/transports/transport-arrival"><i class="icon-share-alt"></i>Выдача</label>

                <ul>
                    <li><a href="#">Выдача</a></li>
                    <li><a href="#">Возврат</a></li>
                    <li><a href="#/delivery/delivery-list" data-translate="delivery.delivery_list.title">Список на доставку</a></li>
                    <li><a href="#/delivery/processing" data-translate="delivery.processing.title">Обработка ПО в СЦ</a></li>
                    <li><a href="#/delivery/collation" data-translate="delivery.collation.title">Сличение ПО</a></li>
                </ul>
            </li>
        </ul>

        <h3 class="uppercase">Администрировние</h3>
        
        <ul class="menu">

            <li>
                <input type="radio" id="ux-menu-ADM" name="ux-menu"/>
                <label for="ux-menu-ADM"><i class="icon-wrench"></i><span data-translate="sidebar.catalogs">Справочники</span></label>

                <ul>
                    <li>
                        <input type="checkbox" id="ux-menu-ADM-common"/>
                        <label for="ux-menu-ADM-common"><i class="icon-info"></i><span data-translate="sidebar.catalogs.common">Общие</span></label>
                        <ul>
                            <li><a href="#/catalog/department" data-translate="sidebar.catalogs.common.departments">Учреждения</a></li>
                            <li><a href="#/catalog/country" data-translate="sidebar.catalogs.common.countries">Страны и территории ISO</a></li>
                        </ul>
                    </li>
                    <li>
                        <input type="checkbox" id="ux-menu-ADM-class"/>
                        <label for="ux-menu-ADM-class"><i class="icon-info"></i><span data-translate="sidebar.catalogs.classifiers">Классификаторы</span></label>
                        <ul>
                            <li><a href="#/catalog/airport" data-translate="sidebar.catalogs.classifiers.airports">Аэропорты</a></li>
                            <li><a href="#/catalog/property/sendtype" data-translate="sidebar.catalogs.classifiers.sendtype">Вид отправлений</a></li>
                            <li><a href="#/catalog/property/specialnotes" data-translate="sidebar.catalogs.classifiers.specialnotes">Особые отметки</a></li>
                            <li><a href="#/catalog/carriercompany" data-translate="sidebar.catalogs.classifiers.carrier_companies">Компании-перевозчики</a></li>
                            <li><a href="#/catalog/sortcenter" data-translate="sidebar.catalogs.classifiers.sort_centers">Сортировочные центры</a></li>
                            <li><a href="#/catalog/postoperator" data-translate="sidebar.catalogs.classifiers.post_operators">Ответственные операторы</a></li>
                            <li><a data-translate="sidebar.catalogs.classifiers.mmpo">ММПО</a></li>
                            <li><a data-translate="sidebar.catalogs.classifiers.tariff_vps">Тарифы ВПС за посылки</a></li>
                            <li><a data-translate="sidebar.catalogs.classifiers.weight_limits">Ограничения весов</a></li>
                            <li><a data-translate="sidebar.catalogs.classifiers.weight_limits_object">Ограничения весов объекта</a></li>
                            <li><a data-translate="sidebar.catalogs.classifiers.allowed_attachment_objects">Допустимые вложения объектов при сортировке</a></li>
                            <li><a data-translate="sidebar.catalogs.classifiers.mail_boxes_vps">Почтовые ящики (обмен с ВПС)</a></li>
                            <li><a data-translate="sidebar.catalogs.classifiers.postmen">Почтальоны</a></li>
                        </ul>
                    </li>
                 </ul>
                <li>
                    <input type="checkbox" id="ux-menu-ADM-Export"/>
                    <label for="ux-menu-ADM-Export"><i class="icon-info"></i><span data-translate="sidebar.catalogs.export_plan">Экспортный план</span></label>
                    <ul>
                        <li><a data-translate="sidebar.catalogs.export_plan.supply_agencies">Учреждения подачи</a></li>
                        <li><a data-translate="sidebar.catalogs.export_plan.shipment_ways">Пути пересылки</a></li>
                        <li><a data-translate="sidebar.catalogs.export_plan.flights">Авиарейсы</a></li>
                    </ul>
                </li>
                <li><input type="checkbox" id="ux-menu-ADM-Import"/>
                    <label for="ux-menu-ADM-Import"><i class="icon-info"></i><span data-translate="sidebar.catalogs.import_plan">Импортный план</span></label>
                    <ul><li><a data-translate="sidebar.catalogs.import_plan.mail_types">Классы почты</a></li>
                        <li><a data-translate="sidebar.catalogs.import_plan.mail_container_types">Классы почты емкости</a></li>
                        <li><a data-translate="sidebar.catalogs.import_plan.exchange_point_codes">Коды пунктов обмена</a></li>
                        <li><a data-translate="sidebar.catalogs.import_plan.arrival_points">Пункты прилета</a></li>
                    </ul>
                </li>
                <li><input type="checkbox" id="ux-menu-ADM-Routes"/>
                    <label for="ux-menu-ADM-Routes"><i class="icon-info"></i><span data-translate="sidebar.catalogs.routes_and_trips">Маршруты и рейсы</span></label>
                    <ul>
                        <li><a data-translate="sidebar.catalogs.routes_and_trips.trips">Рейсы</a></li>
                        <li><a data-translate="sidebar.catalogs.routes_and_trips.transport_means">Транспортные средства</a></li>
                        <li><a data-translate="sidebar.catalogs.routes_and_trips.drivers">Водители транспортных средств</a></li>
                        <li><a data-translate="sidebar.catalogs.routes_and_trips.domestic_carrier_companies">Внутренние компании-перевозчики</a></li>
                    </ul>
                </li>
            </li>

        </ul>

        <h3 class="uppercase">Отчеты</h3>

        <ul class="menu">    
            <li><a href="#/catalog/department" data-translate="sidebar.catalogs.common.departments"><i class="icon-bar-chart"></i>Учреждения</a></li>
            <li><a href="#/catalog/country" data-translate="sidebar.catalogs.common.countries"><i class="icon-social-dribbble"></i> Страны и территории</a></li>
            <li><input type="checkbox" id="ux-menu-REP-Classes"/>
                <label for="ux-menu-REP-Classes"><i class="icon-layers"></i><span data-translate="sidebar.catalogs.classifiers">Классификаторы</span></label>
                
                <ul>
                    <li><a href="#/catalog/airport" data-translate="sidebar.catalogs.classifiers.airports">Аэропорты</a></li>
                    <li><a href="#/catalog/property/sendtype" data-translate="sidebar.catalogs.classifiers.sendtype">Вид отправлений</a></li>
                    <li><a href="#/catalog/property/specialnotes" data-translate="sidebar.catalogs.classifiers.specialnotes">Особые отметки</a></li>
                    <li><a href="#/catalog/carriercompany" data-translate="sidebar.catalogs.classifiers.carrier_companies">Компании-перевозчики</a></li>
                    <li><a href="#/catalog/sortcenter" data-translate="sidebar.catalogs.classifiers.sort_centers">Сортировочные центры</a></li>
                    <li><a href="#/catalog/postoperator" data-translate="sidebar.catalogs.classifiers.post_operators">Ответственные операторы</a></li>
                </ul>
            </li>
        </ul>

    </xsl:template>


</xsl:stylesheet>