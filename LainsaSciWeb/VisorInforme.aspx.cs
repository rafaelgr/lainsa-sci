﻿using System;
using LainsaSciModelo;
using LainsaSciWinWeb;
using LainsaSciInformes;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using Telerik.Reporting;
using System.Collections.Generic;

public partial class VisorInforme : System.Web.UI.Page 
{
    #region Variables declaration
    LainsaSci ctx = null; // openaccess context used in this page
    Usuario usuario = null; // Usuario loged
    Permiso permiso = null;
    Empresa empresa = null;
    string informe = "";
    DateTime desdeFecha;
    DateTime hastaFecha;
    string caller = ""; // who calls the form
    Programa programa = null;
    bool newRecord = true;
    // campos relacionados con las actas
    DateTime fechaActa;
    string observaciones = "";
    string actaNumero = "";
    string tecnicoResponsable = "";
    Instalacion instalacion = null;
    #endregion
    #region Init, load, unload events
    protected void Page_Init(object sender, EventArgs e)
    {
        // it gets an appropiate context (LainsaSciCTX -> web.config)
        ctx = new LainsaSci("LainsaSciCTX");
        // verify if a Usuario is logged
        usuario = CntWinWeb.IsSomeoneLogged(this, ctx);
        if (usuario == null)
            Response.Redirect("Default.aspx");
        else
            Session["UsuarioId"] = usuario.UsuarioId;
        if (Request.QueryString["Informe"] != null)
        {
            informe = Request.QueryString["Informe"];
            switch (informe)
            {
                case "RptInventario":
                    RptInventario rptInventario = new RptInventario();
                    this.Title = "Inventario por instalacion";
                    if (usuario.Empresa != null)
                    {
                        rptInventario.ReportParameters["Empresa"].Value = usuario.Empresa.EmpresaId;
                        rptInventario.ReportParameters["Empresa"].Visible = false;
                    }
                    ReportViewer1.Report = rptInventario;
                    break;
                case "RptIncidenciaEmpresa":
                    RptIncidenciaEmpresa rptIncidenciaEmpresa = new RptIncidenciaEmpresa();
                    this.Title = "Incidencias por empresa";
                    if (usuario.Empresa != null)
                    {
                        rptIncidenciaEmpresa.ReportParameters["Empresa"].Value = usuario.Empresa.EmpresaId;
                        rptIncidenciaEmpresa.ReportParameters["Empresa"].Visible = false;
                    }
                    ReportViewer1.Report = rptIncidenciaEmpresa;
                    break;
            }
        }
        if (Request.QueryString["Observaciones"] != null)
        {
            observaciones = Request.QueryString["Observaciones"];
        }
        if (Request.QueryString["FechaActa"] != null)
        {
            fechaActa = DateTime.Parse(Request.QueryString["FechaActa"]);
        }
        if (Request.QueryString["ActaNumero"] != null)
        {
            actaNumero = Request.QueryString["ActaNumero"];
        }
        if (Request.QueryString["TecnicoResponsable"] != null)
        {
            Usuario usu = CntLainsaSci.GetUsuario(int.Parse(Request.QueryString["TecnicoResponsable"]), ctx);
            tecnicoResponsable = usu.Nombre;
        }
        if (Request.QueryString["InstalacionId"] != null)
        {
            instalacion = CntLainsaSci.GetInstalacion(int.Parse(Request.QueryString["InstalacionId"]), ctx);
            if(instalacion == null)
                empresa = CntLainsaSci.GetEmpresa(int.Parse(Request.QueryString["EmpresaId"]), ctx);

            if (instalacion != null || empresa != null)
            {
                switch (informe)
                {
                    case "RptActa":
                        // este informe es especial y en realidad es un book
                        Plantilla plantilla = CntLainsaSci.GetPlantilla(1, ctx); // la primera plantilla es la de acta.
                        string numeroAutorizado = ConfigurationManager.AppSettings["NumeroAutorizado"];
                        string contenido = String.Format(plantilla.Contenido, numeroAutorizado, tecnicoResponsable, actaNumero, fechaActa);
                        ReportBook reportBook = new ReportBook();
                        RptCartaActa rptCartaActa = new RptCartaActa(contenido);
                        reportBook.Reports.Add(rptCartaActa);
                        if (instalacion != null)
                        {
                            RptInformeActa rptInformeActa = new RptInformeActa(instalacion, observaciones, actaNumero, fechaActa, tecnicoResponsable, ctx);
                            reportBook.Reports.Add(rptInformeActa);
                        }
                        else
                        {
                            RptInformeActaEmpresa rptInformeActaEmpresa = new RptInformeActaEmpresa(empresa, observaciones, actaNumero, fechaActa, tecnicoResponsable, ctx);
                            reportBook.Reports.Add(rptInformeActaEmpresa);
                        }
                        ReportViewer1.Report = reportBook;
                        break;
                }
            }
        }
        else if (Request.QueryString["ProgramaId"] != null)
        {
            programa = CntLainsaSci.GetPrograma(int.Parse(Request.QueryString["ProgramaId"]), ctx);
            if (programa != null)
            {
                switch(informe)
                {
                    case "RptPrograma2":
                        RptPrograma2 rptPrograma2 = new RptPrograma2(programa.ProgramaId, ctx);
                        ReportViewer1.Report = rptPrograma2;
                        break;
                    case "RptRevisionFormulario":
                        RptRevisionFormulario rptRF = new RptRevisionFormulario(programa, ctx);
                        ReportViewer1.Report = rptRF;
                        break;
                    case "RptInformePlanta":
                        RptInformePlanta rptIP = new RptInformePlanta(programa, ctx);
                        ReportViewer1.Report = rptIP;
                        break;
                }
            }
            newRecord = false;
        }
        else if (Request.QueryString["EmpresaId"] != null)
        {
            empresa = CntLainsaSci.GetEmpresa(int.Parse(Request.QueryString["EmpresaId"]), ctx);
            
            if (empresa != null)
            {
                desdeFecha = DateTime.Parse(Request.QueryString["DesdeFecha"]);
                hastaFecha = DateTime.Parse(Request.QueryString["HastaFecha"]);
                switch(informe)
                {
                    case "RptResumenEmpresaInstalacion":
                        RptResumenEmpresaInstalacion rpt = new RptResumenEmpresaInstalacion(desdeFecha, hastaFecha, empresa.EmpresaId, int.Parse(Request.QueryString["InstId"]), ctx);
                        ReportViewer1.Report = rpt;
                        break;
                    case "RptFacturableEmpresaInstalacion":
                        RptFacturableEmpresaInstalacion rpt2 = new RptFacturableEmpresaInstalacion(desdeFecha, hastaFecha, empresa.EmpresaId, int.Parse(Request.QueryString["InstId"]), ctx);
                        ReportViewer1.Report = rpt2;
                        break;
                    case "RptResumenEmpresaTipoDispositivo":
                        RptResumenEmpresaTipoDispositivo rptT = new RptResumenEmpresaTipoDispositivo(desdeFecha, hastaFecha, empresa.EmpresaId, int.Parse(Request.QueryString["TipoDispId"]), ctx);
                        ReportViewer1.Report = rptT;
                        break;
                    case "RptFacturableEmpresaTipoDispositivo":
                        RptFacturableEmpresaTipoDispositivo rptT2 = new RptFacturableEmpresaTipoDispositivo(desdeFecha, hastaFecha, empresa.EmpresaId, int.Parse(Request.QueryString["TipoDispId"]), ctx);
                        ReportViewer1.Report = rptT2;
                        break;
                    case "RptResumenEmpresa":
                        RptResumenEmpresa rptE = new RptResumenEmpresa(desdeFecha, hastaFecha, empresa.EmpresaId, int.Parse(Request.QueryString["InstId"]), int.Parse(Request.QueryString["TipoDispId"]), ctx);
                        ReportViewer1.Report = rptE;
                        break;
                    case "RptFacturableEmpresa":
                        RptFacturableEmpresa rptE2 = new RptFacturableEmpresa(desdeFecha, hastaFecha, empresa.EmpresaId, int.Parse(Request.QueryString["InstId"]), int.Parse(Request.QueryString["TipoDispId"]), ctx);
                        ReportViewer1.Report = rptE2;
                        break;
                }
            }
        }
        else if (Request.QueryString["Filtro"] != null)
        {
            List<string> filtro = (List<string>)Session["Filtro"];
            string consulta = "";
            switch(informe)
            {
                case "RptConsultaRevision":
                    if (Request.QueryString["mode"].ToString() == "G")
                    {
                        RptConsultaRevisionGeneral cr = new RptConsultaRevisionGeneral(filtro);
                        ReportViewer1.Report = cr;
                    }
                    break;
                case "RptConsultaDispositivos":
                    consulta = "Consulta dispositivos. ";
                    if (Session["Consulta"] != null) consulta += (string)Session["Consulta"];
                    this.Title = consulta;
                 
                    if (Request.QueryString["mode"].ToString() == "D")
                    {
                        RptConsultaDispositivos cd = new RptConsultaDispositivos(filtro, consulta);
                        ReportViewer1.Report = cd;
                    }
                    else
                    {
                       RptConsultaDispositivosGeneral cd = new RptConsultaDispositivosGeneral(filtro, consulta);
                        ReportViewer1.Report = cd;
                    }
                    break;
                case "RptInfConsultaRevision":
                    IList<Revision> lr = new List<Revision>();
                    foreach (string rid in filtro)
                    {
                        lr.Add(CntLainsaSci.GetRevision(int.Parse(rid), ctx));
                    }
                    consulta = "Consulta revisiones";
                    if (Session["Consulta"] != null) consulta = (string)Session["Consulta"];
                    this.Title = consulta;
                    RptInfConsultaRevision icr = new RptInfConsultaRevision(lr, consulta);
                    ReportViewer1.Report = icr;
                    break;
            }
        }
        // control de skin
        if (Session["Skin"] != null) RadSkinManager1.Skin = Session["Skin"].ToString();

    }

    protected void Page_Unload(object sender, EventArgs e)
    {
        // it closes context in order to release resources
        if (ctx != null)
            ctx.Dispose();
    }

    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
    }
}