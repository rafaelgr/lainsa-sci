﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccesorioAsignadoForm.aspx.cs" Inherits="DosimetriaWinWeb.AccesorioAsignadoForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head id="Head1" runat="server">
    <title>
      Asignar accesorio
    </title>
   <%-- <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />--%>
    <link href="DosimetriaEstilos.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <form id="form1" runat="server">
      <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
          <%--Needed for JavaScript IntelliSense in VS2010--%>
          <%--For VS2008 replace RadScriptManager with ScriptManager--%>
          <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
          <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
          <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
        </Scripts>
      </telerik:RadScriptManager>
      <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript" src="GridForm.js"></script>
        <script type="text/javascript">
            function loadValues(values) 
            {
                var combo = $find("<%=rdcAccesorios.ClientID %>");
                loadCombo(combo, values);
            }
            function loadCombo(combo, values) {
                var items = combo.get_items();
                items.clear();
                var comboItem = new Telerik.Web.UI.RadComboBoxItem();
                comboItem.set_text(values[1]);
                comboItem.set_value(values[0]);
                items.add(comboItem);
                combo.commitChanges();
                comboItem.select();
            }
            function refreshGrid2(arg, frame) 
            {
                // search for the iframe
                var iframe = document.getElementById(frame);
                iframe.contentWindow.refreshGrid(arg);
            }
        </script>
      </telerik:RadCodeBlock>
      <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
      </telerik:RadAjaxManager>
      <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Simple">
      </telerik:RadSkinManager>
      <div id="MainArea" class="normalText">
        <table style="width:100%;">
          <tr>
            <td>
              <div id="AccesorioId" style="padding:5px;">
                <asp:Label ID="lblAccesorioId" runat="server" Text="ID"></asp:Label>
                <br />
                <telerik:RadTextBox ID="txtAccesorioId" runat="server" Enabled="false" Width="100%" TabIndex="1">
                </telerik:RadTextBox>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div ID="Dispositivo" class="normalText" style="padding:5px;">
                <asp:Label ID="lblDispositivo" runat="server" Text="Dispositivo:" 
                           ToolTip="Dispositivo."></asp:Label>
                &nbsp;
                <asp:ImageButton ID="imgbDispositivo" runat="server" 
                                 CausesValidation="false" ImageUrl="~/images/search_mini.png" 
                                 OnClientClick="searchDispositivo('AccesorioAsignadoForm');" 
                                 ToolTip="Haga clic aquí para buscar Dispositivos" 
                      style="height: 10px" />
                <br />
                <telerik:RadComboBox runat="server" ID="rdcDispositivo" Height="100px" 
                                     Width="100%" ItemsPerRequest="10" 
                                     EnableLoadOnDemand="true" ShowMoreResultsBox="true" EnableVirtualScrolling="true"
                                     EmptyMessage="Escriba aquí ..." TabIndex="1" AutoPostBack="True"
                                     onitemsrequested="rdcDispositivo_ItemsRequested" onselectedindexchanged="rdcDispositivo_SelectedIndexChanged">
                </telerik:RadComboBox>
              </div>
            </td>
          </tr>
           <tr>
            <td>
              <div ID="Accesorio" class="normalText" style="padding:5px;">
                <asp:Label ID="lblAccesorio" runat="server" Text="Accesorio:" 
                           ToolTip="Accesorio asignado al dispositivo"></asp:Label>
                &nbsp;
                <asp:ImageButton ID="imgbAccesorio" runat="server" 
                                 CausesValidation="false" ImageUrl="~/images/search_mini.png" 
                                 OnClientClick="searchAccesorio('AccesorioAsignadoForm');" 
                                 ToolTip="Haga clic aquí para buscar Accesorios" />
                <br />
                <telerik:RadComboBox runat="server" ID="rdcAccesorios" Height="100px" 
                                     Width="100%" ItemsPerRequest="10" 
                                     EnableLoadOnDemand="true" ShowMoreResultsBox="true" EnableVirtualScrolling="true"
                                     EmptyMessage="Escriba aquí ..." TabIndex="1" AutoPostBack="True" 
                                     onitemsrequested="rdcAccesorio_ItemsRequested" 
                                     onselectedindexchanged="rdcAccesorio_SelectedIndexChanged">
                </telerik:RadComboBox>
              </div>
            </td>
          </tr>
          <tr>
            <td>
            </td>
          </tr>
          <tr>
            <td>
              <div ID="Buttons" class="buttonsFormat">
                <asp:ImageButton ID="btnAccept" runat="server" 
                                 ImageUrl="~/images/document_ok.png" onclick="btnAccept_Click" 
                                 ToolTip="Guardar y salir" TabIndex="3" />
                &nbsp;
                <asp:ImageButton ID="btnCancel" runat="server" 
                                 ImageUrl="~/images/document_out.png" CausesValidation="False" 
                                 onclick="btnCancel_Click" ToolTip="Salir sin guardar" 
                                 TabIndex="4" />
              </div>
            </td>
          </tr>
          <tr>
            <td>
              &nbsp;
            </td>
            <td>
              &nbsp;
            </td>
          </tr>
        </table>

      </div>
      <div id="FooterArea">
        <telerik:RadNotification ID="RadNotification1" runat="server" 
                                 ContentIcon="images/warning_32.png" AutoCloseDelay="0" 
                                 TitleIcon="images/warning_16.png" EnableRoundedCorners="True" EnableShadow="True" 
                                 Height="100px" Position="Center" Title="WARNING" Width="300px">
        </telerik:RadNotification>
      </div>
    </form>
  </body>
</html>

