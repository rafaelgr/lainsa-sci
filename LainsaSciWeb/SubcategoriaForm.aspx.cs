﻿using System;
using System.Web;
using System.Web.UI;
using LainsaSciModelo;
using LainsaSciWinWeb;
using Telerik.OpenAccess;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;

public partial class SubcategoriaForm : System.Web.UI.Page
{
    #region Variables declaration
    LainsaSci ctx = null; // openaccess context used in this page
    Usuario usuario = null; // Usuario loged
    Permiso permiso = null;
    string caller = ""; // who calls the form
    Subcategoria Subcategoria = null;
    bool newRecord = true;
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
        //
        permiso = CntLainsaSci.GetPermiso(usuario.GrupoUsuario, "Subcategoriagrid", ctx);
        if (permiso == null)
        {
            RadNotification1.Text = String.Format("<b>{0}</b><br/>{1}",
                                                  (string)GetGlobalResourceObject("ResourceLainsaSci", "Warning"),
                                                  (string)GetGlobalResourceObject("ResourceLainsaSci", "NoPermissionsAssigned"));
            RadNotification1.Show();
            RadAjaxManager1.ResponseScripts.Add("closeWindow();");
        }
        btnAccept.Visible = permiso.Modificar;
        // load the combo
        // Is it a new record or not?
        if (Request.QueryString["SubcategoriaId"] != null)
        {
            Subcategoria = CntLainsaSci.GetSubcategoria(int.Parse(Request.QueryString["SubcategoriaId"]), ctx);
            LoadData(Subcategoria);
            newRecord = false;
        }
        if (Request.QueryString["Caller"] != null)
        {
            caller = Request.QueryString["Caller"];
        }
        // control de skin
        if (Session["Skin"] != null) RadSkinManager1.Skin = Session["Skin"].ToString();

    }

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Page_Unload(object sender, EventArgs e)
    {
        // it closes context in order to release resources
        if (ctx != null)
            ctx.Dispose();
    }
    #endregion
    #region Actions
    protected void btnAccept_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (!DataOk())
                return;
            if (newRecord)
                Subcategoria = new Subcategoria();
            UnloadData(Subcategoria);
            if (newRecord)
            {
                ctx.Add(Subcategoria);
            }
            ctx.SaveChanges();
            if (newRecord)
                RadAjaxManager1.ResponseScripts.Add(String.Format("closeWindowRefreshGrid('{0}', 'new');", caller));
            else
                RadAjaxManager1.ResponseScripts.Add(String.Format("closeWindowRefreshGrid('{0}', 'edit');", caller));
        }
        catch (Exception ex)
        {
            ControlDeError(ex);
        }
    }

    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        RadAjaxManager1.ResponseScripts.Add("closeWindow();");
    }
    #endregion
    #region Auxiliary
    protected bool DataOk()
    {
        if (rdcCategoria.SelectedValue == "")
        {
            RadNotification1.Text = String.Format("<b>{0}</b><br/>{1}",
                                                  (string)GetGlobalResourceObject("ResourceLainsaSci", "Warning"),
                                                  (string)GetGlobalResourceObject("ResourceLainsaSci", "CategoriaNeeded"));
            RadNotification1.Show();
            return false;
        }
        if (txtNombre.Text == "")
        {
            RadNotification1.Text = String.Format("<b>{0}</b><br/>{1}",
                                                  (string)GetGlobalResourceObject("ResourceLainsaSci", "Warning"),
                                                  (string)GetGlobalResourceObject("ResourceLainsaSci", "NombreNeeded"));
            RadNotification1.Show();
            return false;
        }
        return true;
    }

    protected void LoadData(Subcategoria Subcategoria)
    {
        CargaCategoria(Subcategoria.Categoria);
        txtNombre.Text = Subcategoria.Nombre;
    }

    protected void UnloadData(Subcategoria Subcategoria)
    {
        Subcategoria.Nombre = txtNombre.Text;
        Subcategoria.Categoria = CntLainsaSci.GetCategoria(int.Parse(rdcCategoria.SelectedValue), ctx);
    }
    #endregion
    protected void CargaCategoria(Categoria categoria)
    {
        if (categoria == null)
            return;
        rdcCategoria.Items.Clear();
        rdcCategoria.Items.Add(new RadComboBoxItem(categoria.Nombre, categoria.CategoriaId.ToString()));
        rdcCategoria.SelectedValue = categoria.CategoriaId.ToString();
        rdcCategoria.Enabled = false;
    }

    protected void rdcCategoria_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
    {
    }

    protected void rdcCategoria_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        if (e.Text == "")
            return;
        RadComboBox combo = (RadComboBox)sender;
        combo.Items.Clear();
        foreach (Categoria empresa in CntLainsaSci.GetCategorias(e.Text, ctx))
        {
            combo.Items.Add(new RadComboBoxItem(empresa.Nombre, empresa.CategoriaId.ToString()));
        }
    }

    protected void ControlDeError(Exception ex)
    {
        ErrorControl eC = new ErrorControl();
        eC.ErrorUsuario = usuario;
        eC.ErrorProcess = permiso.Proceso;
        eC.ErrorDateTime = DateTime.Now;
        eC.ErrorException = ex;
        Session["ErrorControl"] = eC;
        RadAjaxManager1.ResponseScripts.Add("openOutSide('ErrorForm.aspx','ErrorForm');");
    }
}