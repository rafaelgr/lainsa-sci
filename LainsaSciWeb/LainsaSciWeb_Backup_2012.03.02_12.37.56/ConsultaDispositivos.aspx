﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaDispositivos.aspx.cs" Inherits="ConsultaDispositivos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>
      Consultas dispositivos
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
      <script type="text/javascript">
        //Put your JavaScript code here.
      </script>
      <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
      </telerik:RadAjaxManager>

      <telerik:RadSkinManager ID="RadSkinManager1" Runat="server" Skin="Simple">
      </telerik:RadSkinManager>
      <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Simple">
      </telerik:RadAjaxLoadingPanel>
      <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
        <div id ="Filtros">
          <table width="100%">
            <tr>
              <td>
                <telerik:RadFilter runat="server" ID="RadFilter1" FilterContainerID="RadGrid1">
                </telerik:RadFilter>
              </td>
              <td style="vertical-align:top; width:350px">
                <div id="Guardados1" class="normalText" style="padding:2px">
                  <asp:Label ID="lblFiltro" runat="server" Text="Consultas guardadas:"></asp:Label>
                  <br />
                  <telerik:RadComboBox runat="server" ID="rdcFiltro" Height="100px" 
                                       Width="300px" ItemsPerRequest="10" 
                                       EnableLoadOnDemand="true" ShowMoreResultsBox="true" EnableVirtualScrolling="true"
                                       TabIndex="1" AutoPostBack="True" 
                                       onselectedindexchanged="rdcFiltro_SelectedIndexChanged">
                  </telerik:RadComboBox>
                </div>
                <div id="Guraddaos2" class="normalText" style="padding:2px">
                  <telerik:RadTextBox ID="txtFiltro" runat="server" Width="180px">
                  </telerik:RadTextBox>
                  &nbsp;
                  <telerik:RadButton ID="btnAgregar" runat="server" Text="Agregar" 
                                     onclick="btnAgregar_Click">
                  </telerik:RadButton>
                  &nbsp;
                  <telerik:RadButton ID="btnEliminar" runat="server" Text="Eliminar" 
                                     onclick="btnEliminar_Click">
                  </telerik:RadButton>
                </div>

              </td>
            </tr>
          </table>

        </div>
        <div id="AreaGrid">
          <telerik:RadGrid ID="RadGrid1" runat="server"
                           AllowPaging="True" AllowFilteringByColumn="false" 
                           AllowSorting="True" ShowGroupPanel="false"
                           onitemcommand="RadGrid1_ItemCommand" onitemdatabound="RadGrid1_ItemDataBound" 
                           onneeddatasource="RadGrid1_NeedDataSource" GridLines="None" 
                           Skin="Simple" >
            <GroupingSettings CaseSensitive="False" />
            <ClientSettings AllowDragToGroup="True">
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top"
                             DataKeyNames="DispositivoId">
              <CommandItemSettings ShowAddNewRecordButton="false" ShowExportToCsvButton="true" ShowExportToExcelButton="true"/>
              <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
              </RowIndicatorColumn>
              <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
              </ExpandCollapseColumn>
              <Columns>
                <telerik:GridBoundColumn DataField="DispositivoId" DataType="System.Int32" 
                                         FilterControlToolTip="Filtrar por ID" FilterImageToolTip="Filtro"
                                         HeaderText="ID" 
                                         ReadOnly="True" Visible="false" 
                                         SortExpression="DispositivoId" UniqueName="DispositivoId">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nombre" 
                                         FilterControlToolTip="Filtrar por nombre" FilterImageToolTip="Filtro"
                                         HeaderText="Nombre" 
                                         ReadOnly="True" 
                                         SortExpression="Nombre" UniqueName="Nombre">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="NumeroIndustria" 
                                         FilterControlToolTip="Filtrar por número de industria" FilterImageToolTip="Filtro"
                                         HeaderText="Numero de industria" 
                                         ReadOnly="True" 
                                         SortExpression="NumeroIndustria" UniqueName="NumeroIndustria">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Instalacion.Empresa.Nombre" 
                                         FilterControlToolTip="Filtrar por cliente" FilterImageToolTip="Filtro"
                                         HeaderText="Cliente" 
                                         ReadOnly="True" 
                                         SortExpression="Instalacion.Empresa.Nombre" UniqueName="Instalacion.Empresa.Nombre">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Instalacion.Nombre" 
                                         FilterControlToolTip="Filtrar por instalación" FilterImageToolTip="Filtro"
                                         HeaderText="Instalación" 
                                         ReadOnly="True" 
                                         SortExpression="Instalacion.Nombre" UniqueName="Instalacion.Nombre">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="TipoDispositivo.Nombre" 
                                         FilterControlToolTip="Filtrar por modelo" FilterImageToolTip="Filtro"
                                         HeaderText="Tipo" 
                                         ReadOnly="True" 
                                         SortExpression="TipoDispositivo.Nombre" UniqueName="TipoDispositivo.Nombre">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Posicion" 
                                         FilterControlToolTip="Filtrar por instalación" FilterImageToolTip="Filtro"
                                         HeaderText="Ubicación" 
                                         ReadOnly="True" 
                                         SortExpression="Posicion" UniqueName="Posicion">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="FechaCaducidad" 
                                         FilterControlToolTip="Filtrar por la fecha de caducidad" FilterImageToolTip="Filtro"
                                         HeaderText="Fecha de caducidad" DataType="System.DateTime" DataFormatString="{0:dd/MM/yyyy}"
                                         ReadOnly="True" 
                                         SortExpression="FechaCaducidad" UniqueName="FechaCaducidad">
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="Caducado" 
                                         FilterControlToolTip="Filtrar por cliente" FilterImageToolTip="Filtro"
                                         HeaderText="Caducado" 
                                         ReadOnly="True" Visible="false" 
                                         SortExpression="Caducado" UniqueName="Caducado">
                </telerik:GridBoundColumn>
              </Columns>
            </MasterTableView>
            <FilterMenu EnableImageSprites="False">
            </FilterMenu>
            <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Simple">
            </HeaderContextMenu>
          </telerik:RadGrid>
        </div>
        <div id="Zona aviso">
          <telerik:RadNotification ID="RadNotification1" runat="server" Text="El filtro ha sido agregado, lo puede ver en el desplegable" 
                                   ContentIcon="images/information_32.png" AutoCloseDelay="0" 
                                   TitleIcon="images/information_16.png" EnableRoundedCorners="True" EnableShadow="True" 
                                   Height="400px" Position="Center" Title="ERROR" Width="400px">
          </telerik:RadNotification>
        </div>
      </telerik:RadAjaxPanel>
    </form>
  </body>
</html>
