<%@include file="/apps/foundation/global.jsp"%>

<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/apps/bootstrap/components/tags" %>
<%@taglib prefix="bootstrap-cq-tags" uri="http://www.smithstone-solutions.co.uk/bootstrap/cq/tags" %>
<%@taglib prefix="aem-utils" uri="http://www.smithstone-solutions.co.uk/aem/util/tags" %>

<bootstrap-cq-tags:accordionItemSupportTag/>

<jsp:useBean id="item" type="bootstrap.web.AccordionItemUI" scope="request"/>


<bootstrap:accordion-item headingId="${item.headingId}"
                          bodyId="${item.parentContainerId}_${item.bodyId}"
                          accordionEditablePath="${resource.path}/item-components"
                          in="<%= properties.get("expanded" , "")%>"
                          parentContainerId="${item.parentContainerId} ">

    <jsp:attribute name="heading">

        ${item.heading}

    </jsp:attribute>

    <jsp:attribute name="body">

        <cq:include path="item-components" resourceType="bootstrap/components/accordion/item/parsys"/>



    </jsp:attribute>

</bootstrap:accordion-item>

        <script>

            if(typeof(CQ) != "undefined"){
                CQ.WCM.onEditableReady('${resource.path}/item-components',function(e){
                    var parsys = CQ.WCM.getEditable('${resource.path}/item-components');
                    var state = "${item.state}";
                    if(state != "in" && parsys){
                        parsys.hide();
                    }

                });
            }



        </script>

<cq:include path="end" resourceType="bootstrap/components/accordion/item/end"/>

<div style="clear:both"></div>

