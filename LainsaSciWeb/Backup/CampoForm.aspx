﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CampoForm.aspx.cs" Inherits="CampoForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>
      Campo de la plantilla
    </title>
    <%-- <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />--%>
    <link href="LainsaSciEstilos.css" rel="stylesheet" type="text/css" />
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
              var combo;
              if (values[2] == "Plantilla")
              {
                  combo = $find("<%=rdcPlantilla.ClientID %>");
              }
              if (values[2] == "TipoCampo")
              {
                  combo = $find("<%=rdcTipoCampo.ClientID %>");
              }
              loadCombo(combo, values);
          }
          function loadCombo(combo, values)
          {
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
              <div ID="PlantillaRevision" class="normalText" style="padding:5px;">
                <asp:Label ID="lblPlantilla" runat="server" Text="Plantilla de revisión:" 
                           ToolTip="Plantilla de revisión que contendrá a este campo."></asp:Label>
                &nbsp;
                <asp:ImageButton ID="ImageButton1" runat="server" 
                                 CausesValidation="false" ImageUrl="~/images/search_mini.png" 
                                 OnClientClick="searchPlantilla('CampoForm');" 
                                 ToolTip="Haga clic aquí para buscar las posibles plantillas de revisión." />
                <br />
                <telerik:RadComboBox runat="server" ID="rdcPlantilla" Height="100px" 
                                     Width="100%" ItemsPerRequest="10" 
                                     EnableLoadOnDemand="true" ShowMoreResultsBox="true" EnableVirtualScrolling="true"
                                     EmptyMessage="Escriba aquí ..." TabIndex="1" AutoPostBack="True" 
                                     onitemsrequested="rdcPlantilla_ItemsRequested" 
                                     onselectedindexchanged="rdcPlantilla_SelectedIndexChanged">
                </telerik:RadComboBox>
              </div>
            </td>
          </tr>
          <tr>
            <td >
              <div id="ModeloId" style="padding:5px;">
                <asp:Label ID="lblModeloId" runat="server" Text="ID"></asp:Label>
                <br />
                <telerik:RadTextBox ID="txtCampoId" runat="server" Enabled="false" Width="100%" TabIndex="1">
                </telerik:RadTextBox>
              </div>
            </td>
          </tr>
          <tr>
            <td >
              <div id="ModeloNombre" style="padding:5px;">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre:"></asp:Label>
                <br />
                <telerik:RadTextBox ID="txtNombre" runat="server" Width="100%" TabIndex="2">
                </telerik:RadTextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" 
                                            ControlToValidate="txtNombre" CssClass="normalTextRed"
                                            ErrorMessage="Se necesita un nombre">
                </asp:RequiredFieldValidator>
              </div>
            </td>
          </tr>
          <tr>
            <td >
              <div id="posicion" style="padding:5px;">
                <asp:Label ID="lblPosicion" runat="server" Text="Posicion:"></asp:Label>
                <br />
                <telerik:RadTextBox ID="txtPosicion" runat="server" Width="100%" TabIndex="2">
                </telerik:RadTextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" 
                                            ControlToValidate="txtPosicion" CssClass="normalTextRed"
                                            ErrorMessage="Se necesita una posición.">
                </asp:RequiredFieldValidator>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div ID="TipoCampo" class="normalText" style="padding:5px;">
                <asp:Label ID="lblTipoCampo" runat="server" Text="Tipo de campo:" 
                           ToolTip="Tipo de campo asociado"></asp:Label>
                &nbsp;
                <%--<asp:ImageButton ID="imgbTipoCampo" runat="server" 
                                 CausesValidation="false" ImageUrl="~/images/search_mini.png" 
                                 OnClientClick="searchTipoCampo('CampoForm');" 
                                 ToolTip="Haga clic aquí para buscar los tipos de campo" />
                <br />--%>
                <telerik:RadComboBox runat="server" ID="rdcTipoCampo" Height="100px" 
                                     Width="100%" EmptyMessage="Seleccione un elemento" TabIndex="1">
                </telerik:RadComboBox>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div ID="InformaDe" class="normalText" style="padding:5px;">
                <asp:Label ID="lblInformaDe" runat="server" Text="Informa de:" 
                           ToolTip="De qué informa el campo"></asp:Label>
                &nbsp;
                <%--<asp:ImageButton ID="imgbTipoCampo" runat="server" 
                                 CausesValidation="false" ImageUrl="~/images/search_mini.png" 
                                 OnClientClick="searchTipoCampo('CampoForm');" 
                                 ToolTip="Haga clic aquí para buscar los tipos de campo" />
                <br />--%>
                <telerik:RadComboBox runat="server" ID="rdcInformaDe" Height="100px" 
                                     Width="100%" TabIndex="1">
                </telerik:RadComboBox>
              </div>
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
