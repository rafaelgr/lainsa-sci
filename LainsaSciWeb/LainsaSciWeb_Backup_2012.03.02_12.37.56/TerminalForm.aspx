﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TerminalForm.aspx.cs" Inherits="TerminalForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>
      Terminal
    </title>
    <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
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
          function loadValues(values){
              var combo;
              if (values[2] == "Empresa"){
                  combo = $find("<%=rdcEmpresa.ClientID %>");
              }
              loadCombo(combo, values);
          }
          function loadCombo(combo, values){
              var items = combo.get_items();
              items.clear();
              var comboItem = new Telerik.Web.UI.RadComboBoxItem();
              comboItem.set_text(values[1]);
              comboItem.set_value(values[0]);
              items.add(comboItem);
              combo.commitChanges();
              comboItem.select();
          }
          function refreshGrid(arg) {
              var iframe = document.getElementById("ifRevisiones");
              iframe.contentWindow.refreshGrid(arg);
          }
          function refreshGrid2(arg, frame){
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
            <td width="30%">
              <div id="TerminalId" style="padding:5px;">
                <asp:Label ID="lblTerminalId" runat="server" Text="ID"></asp:Label>
                <br />
                <telerik:RadTextBox ID="txtTerminalId" runat="server" Enabled="false" Width="100%" TabIndex="2">
                </telerik:RadTextBox>
              </div>
            </td>
            <td>
              <div ID="Tipo" class="normalText" style="padding:5px;">
                <asp:Label ID="lblTipo" runat="server" Text="Tipo:" 
                           ToolTip="Tipo de terminal"></asp:Label>
                <br />
                <telerik:RadComboBox runat="server" ID="rdcTipo" Height="100px" 
                                     Width="100%" ItemsPerRequest="10" 
                                     TabIndex="1" AutoPostBack="True">
                </telerik:RadComboBox>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div id="NumeroSerie" style="padding:5px;">
                <asp:Label ID="lblNumeroSerie" runat="server" Text="Número de serie:"></asp:Label>
                <br />
                <telerik:RadTextBox ID="txtNumeroSerie" runat="server" Width="100%" TabIndex="2">
                </telerik:RadTextBox>
                <br />
              </div>
            </td>
            <td>
              <div ID="Empresa" class="normalText" style="padding:5px;">
                <asp:Label ID="lblEmpresa" runat="server" Text="Empresa:" 
                           ToolTip="Empresa a la que pertenece el Terminal"></asp:Label>
                &nbsp;
                <asp:ImageButton ID="imgbEmpresa" runat="server" 
                                 CausesValidation="false" ImageUrl="~/images/search_mini.png" 
                                 OnClientClick="searchEmpresa('TerminalForm');" 
                                 ToolTip="Haga clic aquí para buscar empresas" />
                <br />
                <telerik:RadComboBox runat="server" ID="rdcEmpresa" Height="100px" 
                                     Width="100%" ItemsPerRequest="10" 
                                     EnableLoadOnDemand="true" ShowMoreResultsBox="true" EnableVirtualScrolling="true"
                                     TabIndex="1" AutoPostBack="True">
                </telerik:RadComboBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" 
                                            ControlToValidate="rdcEmpresa" CssClass="normalTextRed"
                                            ErrorMessage="Se necesita una empresa">
                </asp:RequiredFieldValidator>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <div id="Nombre" style="padding:5px;">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                <br />
                <telerik:RadTextBox ID="txtNombre" runat="server" Width="100%" TabIndex="3">
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
            <td colspan="2">
              <div id="Comentarios" style="padding:5px;">
                <asp:Label ID="lblComentarios" runat="server" Text="Comentarios:"></asp:Label>
                <br />
                <telerik:RadTextBox ID="txtComentarios" runat="server" Width="100%" Rows="3" TabIndex="10"
                                    TextMode="MultiLine">
                </telerik:RadTextBox>
              </div>
            </td>
          </tr>
          <tr>
            <td>
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <div ID="Buttons" class="buttonsFormat">

                &nbsp;
                <asp:ImageButton ID="btnAccept" runat="server" 
                                 ImageUrl="~/images/document_ok.png" onclick="btnAccept_Click" 
                                 ToolTip="Guardar y salir" TabIndex="11" />
                <asp:ImageButton ID="btnCancel" runat="server" 
                                 ImageUrl="~/images/document_out.png" CausesValidation="False" 
                                 onclick="btnCancel_Click" ToolTip="Salir sin guardar" 
                                 TabIndex="12" />
              </div>
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
