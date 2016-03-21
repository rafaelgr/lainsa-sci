﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="MainMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FALCK-SCI</title>
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server" />
    <link href="LainsaSciEstilos.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 180px;
            height: 50px;
        }
    </style>
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
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script type="text/javascript" src="MainMenu.js"></script>
        <script type="text/javascript">
            function noHaceNada() {
            }
        </script>
    </telerik:RadScriptBlock>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadMenu1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadWindowManager1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" OnClientCommand="wOnClientCommand"
        RestrictionZoneID="AreaVentanas" IconUrl="images/sci_ico_16.png" Behavior="Resize, Minimize, Maximize, Close, Pin, Move, Reload">
        <Windows>
            <telerik:RadWindow ID="GrupoUsuarioGrid" runat="server" AutoSize="true" Title="Grupos de usuarios"
                NavigateUrl="GrupoUsuarioGrid.aspx" MinHeight="500px" MinWidth="400px" Top="10"
                Left="10" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="GrupoUsuarioForm" runat="server" AutoSize="true" Title="Grupo de usuarios"
                NavigateUrl="GrupoUsuarioForm.aspx" MinHeight="200px" MinWidth="400px" Top="10"
                Left="10" Modal="true" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="GrupoTrabajoGrid" runat="server" AutoSize="true" Title="Grupos de trabajo"
                NavigateUrl="GrupoTrabajoGrid.aspx" MinHeight="500px" MinWidth="400px" Top="10"
                Left="10" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="GrupoTrabajoForm" runat="server" AutoSize="true" Title="Grupo de trabajo"
                NavigateUrl="GrupoTrabajoForm.aspx" MinHeight="200px" MinWidth="400px" Top="10"
                Left="10" Modal="true" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="UsuarioGrid" runat="server" AutoSize="true" Title="Usuarios"
                NavigateUrl="UsuarioGrid.aspx" MaxHeight="768px" MaxWidth="1024px" MinWidth="600px"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="UsuarioForm" runat="server" Title="Usuario" NavigateUrl="UsuarioForm.aspx"
                Height="450px" Width="650px" MaxHeight="768px" MaxWidth="1024px" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ProcesoGrid" runat="server" AutoSize="true" Title="Procesos"
                NavigateUrl="ProcesoGrid.aspx" MinHeight="500px" MinWidth="600px" Top="10" Left="10"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ProcesoForm" runat="server" Title="Proceso" NavigateUrl="ProcesoForm.aspx"
                Height="400px" Width="300px" MaxHeight="768px" MaxWidth="1024px" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="PermisoGrid" runat="server" AutoSize="true" Title="Permisos"
                NavigateUrl="PermisoGrid.aspx" MinHeight="500px" MinWidth="600px" Left="10" Top="10"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="PermisoForm" runat="server" Title="Permiso" NavigateUrl="PermisoForm.aspx"
                Height="400px" Width="400px" MaxHeight="768px" MaxWidth="1024px" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ErrorForm" runat="server" Title="Error" NavigateUrl="ErrorForm.aspx"
                MinHeight="600px" MinWidth="500px" MaxHeight="768px" MaxWidth="1024px" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="EmpresaGrid" runat="server" AutoSize="true" Title="Empresas"
                NavigateUrl="EmpresaGrid.aspx" MinHeight="500px" MinWidth="600px" Top="10" Left="10"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="EmpresaTab" runat="server" Title="Empresa" NavigateUrl="EmpresaTab.aspx"
                Height="700px" Width="1000px" MaxHeight="800px" MaxWidth="1024px" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="EmpresaForm" runat="server" Title="Empresa" NavigateUrl="EmpresaForm.aspx"
                Height="600px" Width="900px" MaxHeight="768px" MaxWidth="1024px" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="TelefonoForm" runat="server" Title="Telefono" NavigateUrl="TelefonoForm.aspx"
                Height="300px" Width="350px" MaxHeight="768px" MaxWidth="1024px" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="DireccionForm" runat="server" Title="Direccion" NavigateUrl="DireccionForm.aspx"
                Height="500px" Width="450px" MaxHeight="768px" MaxWidth="1024px" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="EmailForm" runat="server" Title="Correo electrónico" NavigateUrl="EmailForm.aspx"
                Height="400px" Width="500px" MaxHeight="768px" MaxWidth="1024px" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="InstalacionGrid" runat="server" AutoSize="true" Title="Instalaciones"
                NavigateUrl="InstalacionGrid.aspx" MinHeight="500px" MinWidth="800px" Left="10"
                Top="10" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="InstalacionTab" runat="server" Title="Instalacion" NavigateUrl="InstalacionTab.aspx"
                Height="700px" Width="1000px" MaxHeight="800px" MaxWidth="1024px" KeepInScreenBounds="False"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="InstalacionForm" runat="server" Title="Instalacion" NavigateUrl="InstalacionForm.aspx"
                Height="600px" Width="900px" MaxHeight="768px" MaxWidth="1024px" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ResumenRevisionForm" runat="server" Title="Resumen revisión"
                NavigateUrl="ResumenRevisionForm.aspx" Height="500px" Width="700px" MaxHeight="768px"
                MaxWidth="1024px" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="DispositivoGrid" runat="server" AutoSize="true" Title="Dispositivo"
                NavigateUrl="DispositivoGrid.aspx" MinHeight="500px" MinWidth="800px" Top="10"
                Left="0" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="DispositivoTab" runat="server" Title="Dispositivo" NavigateUrl="DispositivoTab.aspx"
                Width="900px" MinHeight="600px" MinWidth="1000px" Top="0" Left="20" Modal="true"
                AutoSize="true" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="DispositivoForm" runat="server" Title="Dispositivo" NavigateUrl="DispositivoForm.aspx"
                MinHeight="700px" MinWidth="900px" Top="0" Left="20" Modal="true" AutoSize="true"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="TipoGrid" runat="server" AutoSize="true" Title="Tipos de dispositivo"
                NavigateUrl="TipoGrid.aspx" MinHeight="500px" MinWidth="600px" Top="10" Left="10"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="TipoTab" runat="server" Title="Tipo dispositivo" NavigateUrl="TipoTab.aspx"
                MinHeight="500px" MinWidth="600px" Top="10" Left="20" Modal="true" AutoSize="true"
                KeepInScreenBounds="False" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="TipoForm" runat="server" Title="Tipo de dispositivo" NavigateUrl="TipoForm.aspx"
                MinHeight="500px" MinWidth="600px" Top="10" Left="20" Modal="true" AutoSize="true"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ModeloGrid" runat="server" AutoSize="true" Title="Modelos de dispositivos"
                NavigateUrl="ModeloGrid.aspx" MinHeight="500px" MinWidth="400px" Top="10" Left="10"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ModeloForm" runat="server" AutoSize="true" Modal="true" Title="Modelo de dispositivo"
                NavigateUrl="ModeloForm.aspx" MinHeight="350px" MinWidth="400px" Top="10" Left="10"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="AccesorioGrid" runat="server" AutoSize="true" Title="Accesorios de dispositivos"
                NavigateUrl="AccesorioGrid.aspx" MaxHeight="800px" MaxWidth="1024px" MinWidth="400px"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="AccesorioTab" runat="server" Title="Accesorio" NavigateUrl="DispositivoTab.aspx"
                Height="700px" Width="1000px" MaxHeight="800px" MaxWidth="1024px" KeepInScreenBounds="False"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="PlantillaRevisionGrid" runat="server" AutoSize="true" Title="Plantillas de revisión"
                NavigateUrl="PlantillaRevisionGrid.aspx" MinHeight="500px" MinWidth="700px" Top="10"
                Left="10" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="PlantillaRevisionTab" runat="server" Title="Plantilla de revisión"
                NavigateUrl="PlantillaRevisionTab.aspx" MinHeight="500px" MinWidth="800px" Top="0"
                Left="20" Modal="true" AutoSize="true" KeepInScreenBounds="False" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="PlantillaRevisionForm" runat="server" Title="Plantilla de revisión"
                NavigateUrl="PlantillaRevisionForm.aspx" MinHeight="500px" MinWidth="800px" Top="10"
                Left="20" Modal="true" AutoSize="true" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="CampoGrid" runat="server" AutoSize="true" Title="Campos" NavigateUrl="CampoGrid.aspx"
                MaxHeight="800px" MaxWidth="1024px" MinWidth="400px" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="CampoForm" runat="server" Title="Tipo de dispositivo" NavigateUrl="CampoForm.aspx"
                MinHeight="500px" MinWidth="350px" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="TipoCampoGrid" runat="server" AutoSize="true" Title="Campos"
                NavigateUrl="TipoCampoGrid.aspx" MaxHeight="800px" MaxWidth="1024px" MinWidth="400px"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="AgenteExtintorGrid" runat="server" AutoSize="true" Title="Agentes extintores"
                NavigateUrl="AgenteExtintorGrid.aspx" MaxHeight="800px" MaxWidth="1024px" MinWidth="400px"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="AgenteExtintorForm" runat="server" Title="Agente extintor"
                NavigateUrl="AgenteExtintorForm.aspx" Height="250px" Width="350px" MaxHeight="768px"
                MaxWidth="1024px" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="FabricanteGrid" runat="server" AutoSize="true" Title="Fabricantes"
                NavigateUrl="FabricanteGrid.aspx" MaxHeight="800px" MaxWidth="1024px" MinWidth="400px"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="FabricanteForm" runat="server" Title="Fabricante del dispositivo"
                NavigateUrl="FabricanteForm.aspx" Height="250px" Width="350px" MaxHeight="768px"
                MaxWidth="1024px" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="PlanificacionRevisionGrid" runat="server" AutoSize="true"
                Title="Planificación de revisiones" NavigateUrl="PlanificacionRevisionGrid.aspx"
                MaxHeight="800px" MaxWidth="1024px" MinWidth="400px" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="PlanificacionRevisionForm" runat="server" Title="Planificación de la revisión"
                NavigateUrl="PlanificacionRevisionForm.aspx" Height="350px" Width="350px" MaxHeight="768px"
                MaxWidth="1024px" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RevisionGrid" runat="server" AutoSize="true" Title="Revisiones"
                NavigateUrl="RevisionGrid.aspx" MinWidth="900px" MinHeight="500px" Top="10" Left="10"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RevisionForm" runat="server" AutoSize="true" Title="Revisión"
                NavigateUrl="RevisionForm.aspx" MinWidth="750px" MaxHeight="800px" MaxWidth="1024px"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ProgramarGrid" runat="server" AutoSize="true" Title="Programar revisión"
                NavigateUrl="ProgramarGrid.aspx" MinWidth="1024px" MinHeight="500px" Top="0"
                Left="0" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ProgramaGrid" runat="server" AutoSize="true" Title="Programas de revision"
                NavigateUrl="ProgramaGrid.aspx" MinHeight="500px" MinWidth="600px" Top="10" Left="10"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ProgramaForm" runat="server" Title="Programa" NavigateUrl="EmpresaForm.aspx"
                MinHeight="700px" MinWidth="1024px" Top="10" Left="10" AutoSize="true" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="VisorInforme" runat="server" Behavior="Resize, Minimize, Close, Pin, Move, Reload, Maximize"
                InitialBehaviors="Maximize" Title="Programa" NavigateUrl="VisorInforme.aspx"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ConsultaRevisiones" runat="server" Behavior="Resize, Minimize, Close, Pin, Move, Reload, Maximize"
                Title="Consulta revisiones" NavigateUrl="ConsultaRevisiones.aspx" MinHeight="700px"
                MinWidth="1024px" Top="10" Left="10" AutoSize="true" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ConsultaDispositivos" runat="server" Behavior="Resize, Minimize, Close, Pin, Move, Reload, Maximize"
                Title="Consulta dispositivos" NavigateUrl="ConsultaDispositivos.aspx" MinHeight="700px"
                MinWidth="1024px" Top="10" Left="10" AutoSize="true" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ConsultaIncidencias" runat="server" Behavior="Resize, Minimize, Close, Pin, Move, Reload, Maximize"
                Title="Consulta incidencias" NavigateUrl="ConsultaIncidencias.aspx" MinHeight="700px"
                MinWidth="1024px" Top="10" Left="10" AutoSize="true" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="SustitucionGrid" runat="server" AutoSize="true" Title="Sustituciones de dispositivos"
                NavigateUrl="SustitucionGrid.aspx" MinHeight="500px" MinWidth="600px" Top="10"
                Left="10" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="SustitucionForm" runat="server" AutoSize="true" Modal="true"
                Title="Sustitución de dispositivo" NavigateUrl="SustitucionForm.aspx" MinHeight="450px"
                MinWidth="600px" Top="10" Left="10" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="TerminalGrid" runat="server" AutoSize="true" Title="Terminales"
                NavigateUrl="TerminalGrid.aspx" MinHeight="500px" MinWidth="800px" Top="10" Left="0"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="TerminalTab" runat="server" Title="Terminal" NavigateUrl="TerminalTab.aspx"
                Width="900px" MinHeight="600px" MinWidth="600px" Top="0" Left="20" Modal="true"
                AutoSize="true" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="TerminalForm" runat="server" Title="Terminal" NavigateUrl="TerminalForm.aspx"
                MinHeight="700px" MinWidth="700px" Top="0" Left="20" Modal="true" AutoSize="true"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="CategoriaGrid" runat="server" AutoSize="true" Title="Categorias de documentos"
                NavigateUrl="CategoriaGrid.aspx" MinHeight="500px" MinWidth="400px" Top="10"
                Left="10" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="CategoriaForm" runat="server" AutoSize="true" Modal="true"
                Title="Categoria de documento" NavigateUrl="CategoriaForm.aspx" MinHeight="250px"
                MinWidth="400px" Top="10" Left="10" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="SubcategoriaGrid" runat="server" AutoSize="true" Title="Subcategorias de documentos"
                NavigateUrl="SubcategoriaGrid.aspx" MinHeight="500px" MinWidth="400px" Top="10"
                Left="10" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="SubcategoriaForm" runat="server" AutoSize="true" Modal="true"
                Title="Subcategoria de documento" NavigateUrl="SubcategoriaForm.aspx" MinHeight="350px"
                MinWidth="550px" Top="10" Left="10" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="GrupoMensajesGrid" runat="server" AutoSize="true" Title="Grupos de mensajes"
                NavigateUrl="GrupoMensajesGrid.aspx" MinHeight="500px" MinWidth="400px" Top="10"
                Left="10" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="GrupoMensajesForm" runat="server" AutoSize="true" Modal="true"
                Title="Grupo de mensajes" NavigateUrl="GrupoMensajesForm.aspx" MinHeight="250px"
                MinWidth="400px" Top="10" Left="10" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="MensajeGrid" runat="server" AutoSize="true" Title="Mensajes"
                NavigateUrl="MensajeGrid.aspx" MinHeight="500px" MinWidth="400px" Top="10" Left="10"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="MensajeForm" runat="server" AutoSize="true" Modal="true" Title="Mensaje"
                NavigateUrl="MensajeForm.aspx" MinHeight="350px" MinWidth="700px" Top="10" Left="10"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="UsuarioExtranetGrid" runat="server" AutoSize="true" Title="Usuarios extranet"
                NavigateUrl="UsuarioExtranetGrid.aspx" MinHeight="500px" MinWidth="600px" Top="10"
                Left="10" KeepInScreenBounds="False" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="UsuarioExtranetTab" runat="server" Title="Usuario extranet"
                NavigateUrl="UsuarioExtranetTab.aspx" MinHeight="500px" MinWidth="650px" Top="10"
                Left="10" KeepInScreenBounds="False" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="UsuarioExtranetForm" runat="server" Title="Usuario extranet"
                NavigateUrl="UsuarioExtranetForm.aspx" MinHeight="500px" MinWidth="600px" Top="10"
                Left="10" KeepInScreenBounds="False" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RepositorioTmpForm" runat="server" Title="Repositorio temporal"
                NavigateUrl="RepositorioTmpForm.aspx" MinHeight="600px" MinWidth="800px" Top="15"
                Left="15" KeepInScreenBounds="False" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="DocumentoView" runat="server" Title="Documento" NavigateUrl="DocumentoView.aspx"
                MinHeight="600px" MinWidth="900px" Top="15" Left="15" KeepInScreenBounds="False"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="DocumentoGrid" runat="server" AutoSize="true" Title="Documentos"
                NavigateUrl="DocumentoGrid.aspx" MinHeight="600px" MinWidth="800px" Top="15"
                Left="15" KeepInScreenBounds="False" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="TipoAnomaliaGrid" runat="server" AutoSize="true" Title="Tipos de anomalía"
                NavigateUrl="TipoAnomaliaGrid.aspx" MinHeight="500px" MinWidth="400px" Top="10"
                Left="10" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="TipoAnomaliaForm" runat="server" AutoSize="true" Modal="true"
                Title="Tipo anomalía" NavigateUrl="TipoAnomaliaForm.aspx" MinHeight="250px" MinWidth="400px"
                Top="10" Left="10" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="VisorInformeCompuesto" runat="server" Behaviors="Resize, Minimize, Close, Pin, Move, Reload, Maximize"
                Title="Informes" NavigateUrl="VisorInformeCompuesto.aspx" Height="700px" Width="900px"
                Top="10" Left="10" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="RevisionNoPeriodica" runat="server" Modal="true" AutoSize="true"
                AutoSizeBehaviors="Width,Height" Title="Revisión no periódica" NavigateUrl="RevisionNoPeriodica.aspx"
                MinWidth="425px" MinHeight="300px" Top="10" Left="10" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas" VisibleStatusbar="False" VisibleTitlebar="False">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ProgramacionInformeForm" runat="server" Modal="true" AutoSize="true"
                AutoSizeBehaviors="Width,Height" Title="Programacion de informe" NavigateUrl="ProgramacionInformeForm.aspx"
                MinWidth="600px" MinHeight="300px" Top="10" Left="10" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas" VisibleStatusbar="False" VisibleTitlebar="False">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ProgramacionInformeGrid" runat="server" AutoSize="true" Title="Programacion de informes"
                NavigateUrl="ProgramacionInformeGrid.aspx" MinHeight="500px" MinWidth="400px"
                Top="10" Left="10" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ProgramacionExe" runat="server" Modal="true" AutoSize="true"
                AutoSizeBehaviors="Width,Height" Title="Ejecutar programa" NavigateUrl="ProgramacionExe.aspx"
                MinWidth="500px" MinHeight="500px" Top="10" Left="10" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas" VisibleStatusbar="False" VisibleTitlebar="False">
            </telerik:RadWindow>
            <telerik:RadWindow ID="GenerarRevisionesExe" runat="server" Modal="true" AutoSize="true"
                AutoSizeBehaviors="Width,Height" Title="Generar revisiones" NavigateUrl="GenerarRevisionesExe.aspx"
                MinWidth="600px" MinHeight="500px" Top="10" Left="10" KeepInScreenBounds="false"
                RestrictionZoneID="AreaVentanas" VisibleStatusbar="False" VisibleTitlebar="False">
            </telerik:RadWindow>
            <telerik:RadWindow ID="PlantillaForm" runat="server" Title="Plantilla" NavigateUrl="PlantillaForm.aspx"
                MinHeight="600px" MinWidth="800px" Top="10" Left="10" KeepInScreenBounds="False"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="PlantillaGrid" runat="server" AutoSize="true" Title="Plantillas"
                NavigateUrl="PlantillaGrid.aspx" MinHeight="500px" MinWidth="600px" Top="10"
                Left="10" KeepInScreenBounds="False" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="IncidenciaGrid" runat="server" Title="Incidencias" NavigateUrl="IncidenciaGrid.aspx"
                MinHeight="600px" MinWidth="900px" Top="10" Left="10" KeepInScreenBounds="False"
                RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="IncidenciaForm" runat="server" AutoSize="true" Title="Incidencia"
                NavigateUrl="IncidenciaForm.aspx" MinHeight="650px" MinWidth="900px" Top="10"
                Left="10" KeepInScreenBounds="False" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="IncidenciaEvolucionForm" runat="server" AutoSize="true" Title="Evolución de incidencia"
                NavigateUrl="IncidenciaEvolucionForm.aspx" MinHeight="300px" MinWidth="500px" Top="10"
                Left="10" KeepInScreenBounds="False" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ModeloTerminalGrid" runat="server" AutoSize="true" Title="Exportar"
                NavigateUrl="ModeloTerminalGrid.aspx" MinHeight="500px" MinWidth="600px" Top="10"
                Left="10" KeepInScreenBounds="False" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="CargaTerminal" runat="server" AutoSize="true" Title="Terminales"
                NavigateUrl="CargaTerminal.aspx" MinHeight="500px" MinWidth="600px" Top="10"
                Left="10" KeepInScreenBounds="False" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ImportTerminalII" runat="server" AutoSize="true" Title="Importar"
                NavigateUrl="ImportTerminalII.aspx" MinHeight="600px" MinWidth="800px" Top="10"
                Left="10" KeepInScreenBounds="False" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="EstadoGrid" runat="server" AutoSize="true" Title="Estados de incidencia"
                NavigateUrl="EstadoGrid.aspx" MaxHeight="800px" MaxWidth="1024px" MinWidth="400px"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="EstadoForm" runat="server" Title="Estado de incidencia"
                NavigateUrl="EstadoForm.aspx" MinHeight="300px" MinWidth="600px"
                MaxWidth="1024px" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="PrioridadGrid" runat="server" AutoSize="true" Title="Prioridades"
                NavigateUrl="PrioridadGrid.aspx" MaxHeight="800px" MaxWidth="1024px" MinWidth="400px"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="PrioridadForm" runat="server" Title="Prioridad"
                NavigateUrl="PrioridadForm.aspx" MinHeight="250px" MinWidth="600px"
                MaxWidth="1024px" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ResponsableGrid" runat="server" AutoSize="true" Title="Responsables"
                NavigateUrl="ResponsableGrid.aspx" MaxHeight="800px" MaxWidth="1024px" MinWidth="400px"
                KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
            <telerik:RadWindow ID="ResponsableForm" runat="server" Title="Responsable"
                NavigateUrl="ResponsableForm.aspx"  MinHeight="250px" MinWidth="600px"
                MaxWidth="1024px" KeepInScreenBounds="false" RestrictionZoneID="AreaVentanas">
            </telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>
    <div id="MainArea">
        <div id="AreaTitulo" class="tituloMain">
            <table style="width: 100%;">
                <tr>
                    <td class="alineadoDerecha">
                        <img alt="logo" class="style1" longdesc="logo" src="images/Falck.JPG" align="left" />
                        <%--<asp:Label ID="lblTitulo" runat="server" Text="Lainsa-SCI"></asp:Label>--%>
                        <asp:Label ID="lblUsuario" runat="server" Text="Usuario"></asp:Label>
                    </td>
                    <td class="alineadoDerecha">
                        <asp:Label ID="lblVersion" runat="server" Text="Vrs 0.0.0"></asp:Label>
                        <br />
                        <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true"  OnSkinChanged="RadSkinManager1_SkinChanged" Skin="Simple" ></telerik:RadSkinManager>
                    </td>
                </tr>
            </table>
        </div>
        <div id="AreaMenu">
            <%-- onitemclick="RadMenu1_ItemClick"--%>
            <telerik:RadMenu ID="RadMenu1" runat="server" Width="100%" OnClientItemClicked="openMenuItem"
                Style="top: -1px; left: 2px; height: 26px">
                <Items>
                    <telerik:RadMenuItem runat="server" Text="Administracion" Value="administracion"
                        PostBack="false">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Grupos de usuarios" Value="GrupoUsuarioGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Grupos de trabajo" Value="GrupoTrabajoGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Usuarios" Value="UsuarioGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Procesos" Value="ProcesoGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Permisos" Value="PermisoGrid">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>
                    <telerik:RadMenuItem runat="server" Text="Datos del sistema" Value="datos" PostBack="false">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Empresas" Value="EmpresaGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Instalaciones" Value="InstalacionGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Operarios" Value="OperarioGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Dispositivos" PostBack="false" Value="DatosDispositivos">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Text="Dispositivos" Value="DispositivoGrid">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem runat="server" Text="Tipos de dispositivo" Value="TipoGrid">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem runat="server" Text="Modelos de dispositivo" Value="ModeloGrid">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem runat="server" Text="Agentes extintores" Value="AgenteExtintorGrid">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem runat="server" Text="Fabricantes" Value="FabricanteGrid">
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Incidencias" Value="incidencias">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Text="Incidencias" Value="IncidenciaGrid">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem runat="server" Text="Estados para incidencia" Value="EstadoGrid">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem runat="server" Text="Prioridades para incidencia" Value="PrioridadGrid">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem runat="server" Text="Responsables" Value="ResponsableGrid">
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Plantillas de revisión" Value="PlantillaRevisionGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Tipos de anomalías" Value="TipoAnomaliaGrid">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>
                    <telerik:RadMenuItem runat="server" Text="Revisiones" Value="revisiones" PostBack="false">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Revisiones" Value="RevisionGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Programar revisiones" Value="ProgramarGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Revisiones programadas" Value="ProgramaGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Generar revisiones (instalacion)" Value="GenerarRevisionesExe">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Sustituciones" Value="SustitucionGrid">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>
                    <telerik:RadMenuItem runat="server" Text="Terminales" Value="terminales">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Mantenimiento terminales" Value="TerminalGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Exportar terminal" Value="ModeloTerminalGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Carga de terminales" Value="CargaTerminal">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Importar terminal" Value="ImportTerminalII">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>
                    <telerik:RadMenuItem runat="server" Text="Ventanas" Value="windows">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="En mosaico" Value="tile">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="En cascada" Value="cascade">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>
                    <telerik:RadMenuItem runat="server" Text="Consultas" Value="consultas">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Consultar revisiones" Value="ConsultaRevisiones">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Consultar dispositivos" Value="ConsultaDispositivos">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Consulta incidencias" Value="ConsultaIncidencias">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>
                    <telerik:RadMenuItem runat="server" Text="Extranet" Value="extranet">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Categorias de documentos" Value="CategoriaGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Subcategorias de documentos" Value="SubcategoriaGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Grupos de mensajes" Value="GrupoMensajesGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Mensajes" Value="MensajeGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Usuarios de la extranet" Value="UsuarioExtranetGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Documentos" Value="DocumentoGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Repositorio temporal" Value="RepositorioTmpForm">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>
                    <telerik:RadMenuItem runat="server" Text="Informes" Value="informes">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Plantillas" Value="PlantillaGrid">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Programacion" Value="programacion" Owner="">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Text="Programacion de informes" Value="ProgramacionInformeGrid"
                                        Owner="">
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem runat="server" Text="Ejecutar programación" Value="ProgramacionExe"
                                        Owner="">
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Resumen de revisiones y anomalías" Value="RptResumenEmpresaInstalacion">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Revisiones facturables" Value="RptFacturableEmpresaInstalacion">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Actas" Value="RptActa">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Inventario por instalación" Value="RptInventario">
                            </telerik:RadMenuItem>
                            <telerik:RadMenuItem runat="server" Text="Incidencias" Value="RptIncidenciaEmpresa">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenuItem>
                </Items>
                <WebServiceSettings>
                    <ODataSettings InitialContainerName="">
                    </ODataSettings>
                </WebServiceSettings>
            </telerik:RadMenu>
        </div>
        <div id="AreaToolBar">
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="Salir" Value="salir" ImageUrl="~/images/exit_24.png">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" ImageUrl="~/images/window_dialog_24.png"
                        Text="Test" Value="test">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </div>
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Width="100%">
            <div id="AreaVentanas" class="areaMain"></div>
        </telerik:RadAjaxPanel>
        <div id="AreaPie" class="areaFooter">
            <telerik:RadNotification ID="RadNotification1" runat="server" ContentIcon="images/graduate_32.png"
                AutoCloseDelay="0" TitleIcon="images/graduation_hat2_16.png" EnableRoundedCorners="True"
                EnableShadow="True" Height="200px" Position="Center" Title="MASTER" Width="285px">
            </telerik:RadNotification>
            <asp:Label ID="lblFooter1" runat="server" Text="(c) Ariadna Software S.L 2011"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>
