﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TipoForm.aspx.cs" Inherits="TipoForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>
      Tipo de dispositivo
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
            function loadValues(values) {
                var combo;
                if (values[2] == "Instalacion") {
                    combo = $find("<%=rdcInstalacion.ClientID %>");
                }
                if (values[2] == "Empresa") {
                    combo = $find("<%=rdcEmpresa.ClientID %>");
                }
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
        </script>
      </telerik:RadCodeBlock>
      <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
      </telerik:RadAjaxManager>
      <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Simple">
      </telerik:RadSkinManager>
      <div id="MainArea" class="normalText">
        <table style="width:100%;">
          <tr>
            <td width="20%">
              <div id="TipoId" style="padding:5px;">
                <asp:Label ID="lblTipoId" runat="server" Text="ID"></asp:Label>
                <br />
                <telerik:RadTextBox ID="txtTipoId" runat="server" Enabled="false" Width="100%" TabIndex="1">
                </telerik:RadTextBox>
              </div>
            </td>
                        <td>
              <div id="tipoNombre" style="padding:5px;">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                <br />
                <telerik:RadTextBox ID="txtNombre" runat="server" Width="100%" TabIndex="2">
                </telerik:RadTextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" 
                                            ControlToValidate="txtNombre" CssClass="normalTextRed"
                                            ErrorMessage="Se necesita un nombre">
                </asp:RequiredFieldValidator>
              </div>
            </td>
          </tr>
                    <tr>
            <td>
            </td>
            <td>
              <div ID="Empresa" class="normalText" style="padding:5px;">
                <asp:Label ID="lblEmpresa" runat="server" Text="Empresa:" 
                           ToolTip="Empresa a la que pertenece usuario"></asp:Label>
                &nbsp;<asp:ImageButton ID="imgEmpresa" runat="server" 
                                 CausesValidation="false" ImageUrl="~/images/search_mini.png" 
                                 OnClientClick="searchEmpresa('TipoTab');" 
                                 ToolTip="Haga clic aquí para buscar grupos" />
                <br />
                <telerik:RadComboBox runat="server" ID="rdcEmpresa" Height="100px" CausesValidation="false" 
                                     Width="250px" ItemsPerRequest="10" 
                                     EnableLoadOnDemand="true" ShowMoreResultsBox="true" EnableVirtualScrolling="true"
                                     TabIndex="5" AutoPostBack="True" 
                      onselectedindexchanged="rdcEmpresa_SelectedIndexChanged">
                </telerik:RadComboBox>
              </div>
            </td>
          </tr>
          <tr>
            <td>
            </td>
            <td>
              <div ID="Instalacion" class="normalText" style="padding:5px;">
                <asp:Label ID="lblInstalacion" runat="server" Text="Instalacion:" 
                           ToolTip="Empresa a la que pertenece usuario"></asp:Label>
                &nbsp;<asp:ImageButton ID="imgInstalacion" runat="server" 
                                 CausesValidation="false" ImageUrl="~/images/search_mini.png" 
                                 OnClientClick="searchInstalacion('TipoTab');" 
                                 ToolTip="Haga clic aquí para buscar grupos" />
                <br />
                <telerik:RadComboBox runat="server" ID="rdcInstalacion" Height="100px" CausesValidation="false" 
                                     Width="250px" ItemsPerRequest="10" 
                                     EnableLoadOnDemand="true" ShowMoreResultsBox="true" EnableVirtualScrolling="true"
                                     TabIndex="5" AutoPostBack="True">
                </telerik:RadComboBox>
              </div>
            </td>
          </tr>
           <tr>
           <td></td>
           <td>
                         <div id="Caducidad" style="padding:5px;">
                <asp:Label ID="lblCaducidad" runat="server" Text="Número de años para caducidad:"></asp:Label>
                <br />
                             <telerik:RadNumericTextBox ID="txtCaducidad" runat="server" 
                                 DataType="System.Int32">
<NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                             </telerik:RadNumericTextBox>
                <br />

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" 
                                            ControlToValidate="txtCaducidad" CssClass="normalTextRed"
                                            ErrorMessage="Se necesita un valor para caducidad">
                </asp:RequiredFieldValidator>
              </div>
           </td>

          </tr>
          <tr>
            <td colspan="2">
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
