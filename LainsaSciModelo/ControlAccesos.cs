using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LainsaSciModelo
{
    public static partial class CntLainsaSci
    {
        // 
        public static IList<Empresa> GetEmpresas(Usuario usu, LainsaSci ctx)
        {
            if (usu.Empresa == null) return ctx.Empresas.ToList<Empresa>();
            return (from e in ctx.Empresas
                    where e.EmpresaId == usu.Empresa.EmpresaId
                    orderby e.Nombre
                    select e).ToList<Empresa>();
        }
        //
        public static IList<Instalacion> GetInstalaciones(Usuario usu, LainsaSci ctx)
        {
            if (usu.Empresa == null) return ctx.Instalacions.OrderBy(x=>x.Nombre).ToList<Instalacion>();
            if (usu.Instalacion == null)
            {
                return usu.Empresa.Instalaciones.OrderBy(x=>x.Nombre).ToList<Instalacion>();
            }
            else
            {
                return (from i in ctx.Instalacions
                        where i.InstalacionId == usu.Instalacion.InstalacionId
                        orderby i.Nombre
                        select i).ToList<Instalacion>();
            }
        }
        //
        public static IList<Dispositivo> GetDispositivos(Usuario usu, LainsaSci ctx)
        {
            IList<Dispositivo> dsps = new List<Dispositivo>();
            if (usu.Empresa == null) return dsps = ctx.Dispositivos.ToList<Dispositivo>();
            if (usu.Instalacion == null)
            {
                return dsps = (from d in ctx.Dispositivos
                        where d.Instalacion != null && d.Instalacion.Empresa.EmpresaId == usu.Empresa.EmpresaId
                        select d).ToList<Dispositivo>();
            }
            else
            {
                return dsps = (from d in ctx.Dispositivos
                               where d.Instalacion != null &&  d.Instalacion.InstalacionId == usu.Instalacion.InstalacionId
                        select d).ToList<Dispositivo>();
            }
        }
        public static IList<Dispositivo> GetDispositivos(Usuario usu, bool caducados, LainsaSci ctx)
        {
            IList<Dispositivo> dsps = new List<Dispositivo>();
            if (usu.Empresa == null) return dsps = (from d in ctx.Dispositivos
                                                    where d.Caducado == caducados
                                                    select d).ToList<Dispositivo>();
            if (usu.Instalacion == null)
            {
                return dsps = (from d in ctx.Dispositivos
                               where d.Instalacion != null && d.Instalacion.Empresa.EmpresaId == usu.Empresa.EmpresaId
                               && d.Caducado == caducados
                               select d).ToList<Dispositivo>();
            }
            else
            {
                return dsps = (from d in ctx.Dispositivos
                               where d.Instalacion != null && d.Instalacion.InstalacionId == usu.Instalacion.InstalacionId
                               && d.Caducado == caducados
                               select d).ToList<Dispositivo>();
            }
        }
        public static IList<Dispositivo> GetDispositivos(string nomParcial, Usuario usu, LainsaSci ctx)
        {
            IList<Dispositivo> dsps = (from d in ctx.Dispositivos
                                           where d.Nombre.StartsWith(nomParcial)
                                           select d).ToList<Dispositivo>();
            if (usu.Empresa == null) return dsps;
            if (usu.Instalacion == null)
            {
                return dsps = (from d in dsps
                               where d.Instalacion != null && d.Instalacion.Empresa.EmpresaId == usu.Empresa.EmpresaId
                               select d).ToList<Dispositivo>();
            }
            else
            {
                return dsps = (from d in dsps
                               where d.Instalacion != null && d.Instalacion.InstalacionId == usu.Instalacion.InstalacionId
                               select d).ToList<Dispositivo>();
            }
        }
        public static IList<Dispositivo> GetDispositivos(string nomParcial, Usuario usu, bool caducados, LainsaSci ctx)
        {
            IList<Dispositivo> dsps = (from d in ctx.Dispositivos
                                       where d.Nombre.StartsWith(nomParcial)
                                       && d.Caducado == caducados
                                       select d).ToList<Dispositivo>();
            if (usu.Empresa == null) return dsps;
            if (usu.Instalacion == null)
            {
                return dsps = (from d in dsps
                               where d.Instalacion != null && d.Instalacion.Empresa.EmpresaId == usu.Empresa.EmpresaId
                               && d.Caducado == caducados
                               select d).ToList<Dispositivo>();
            }
            else
            {
                return dsps = (from d in dsps
                               where d.Instalacion != null && d.Instalacion.InstalacionId == usu.Instalacion.InstalacionId
                               && d.Caducado == caducados
                               select d).ToList<Dispositivo>();
            }
        }
        public static IList<TipoDispositivo> GetTipoDispositivos(Usuario usu, LainsaSci ctx)
        {

            IList<TipoDispositivo> ldp = new List<TipoDispositivo>();
            IList<TipoDispositivo> ldp0 = new List<TipoDispositivo>();
            IList<TipoDispositivo> ldp1 = new List<TipoDispositivo>();
            IList<TipoDispositivo> ldp2 = new List<TipoDispositivo>();
            // Hay tres listas posibles.
            // 0 - No pertenecen a ninguna empresa ni instalacion
            ldp0 = (from tp in ctx.TipoDispositivos
                                           where tp.Empresa == null
                                           && tp.Instalacion == null
                                           select tp).ToList();
            // Valoramos los tres casos posibles
            if (usu.Empresa == null && usu.Instalacion == null)
            {
                ldp = ctx.TipoDispositivos.ToList<TipoDispositivo>();
            }
            else
            {
                if (usu.Empresa != null && usu.Instalacion == null)
                {
                    // 1 - Pertenecen a la empresa pero a ninguna instalacion
                    ldp1 = (from tp in ctx.TipoDispositivos
                            where tp.Empresa.EmpresaId == usu.Empresa.EmpresaId
                            select tp).ToList();
                    ldp = ldp0.Concat(ldp1).ToList<TipoDispositivo>();
                }
                else
                {
                    // 2 - Pertenecen a la empresa y a esta instalacion
                    ldp2 = (from tp in ctx.TipoDispositivos
                            where tp.Empresa.EmpresaId == usu.Empresa.EmpresaId
                            && tp.Instalacion.InstalacionId == usu.Instalacion.InstalacionId
                            select tp).ToList();
                    ldp = ldp0.Concat(ldp1).ToList<TipoDispositivo>().Concat(ldp2).ToList<TipoDispositivo>();
                }
            }
            return ldp;
        }

        public static IList<ModeloDispositivo> GetModeloDispositivos(Usuario usu, LainsaSci ctx)
        {

            IList<ModeloDispositivo> ldp = new List<ModeloDispositivo>();
            IList<ModeloDispositivo> ldp0 = new List<ModeloDispositivo>();
            IList<ModeloDispositivo> ldp1 = new List<ModeloDispositivo>();
            IList<ModeloDispositivo> ldp2 = new List<ModeloDispositivo>();
            // Hay tres listas posibles.
            // 0 - No pertenecen a ninguna empresa ni instalacion
            ldp0 = (from tp in ctx.ModeloDispositivos
                    where tp.Empresa == null
                    && tp.Instalacion == null
                    select tp).ToList();
            // Valoramos los tres casos posibles
            if (usu.Empresa == null && usu.Instalacion == null)
            {
                ldp = ctx.ModeloDispositivos.ToList<ModeloDispositivo>();
            }
            else
            {
                if (usu.Empresa != null && usu.Instalacion == null)
                {
                    // 1 - Pertenecen a la empresa pero a ninguna instalacion
                    ldp1 = (from tp in ctx.ModeloDispositivos
                            where tp.Empresa != null && tp.Empresa.EmpresaId == usu.Empresa.EmpresaId
                            && tp.Instalacion == null
                            select tp).ToList();
                    ldp = ldp0.Concat(ldp1).ToList<ModeloDispositivo>();
                }
                else
                {
                    // 2 - Pertenecen a la empresa y a esta instalacion
                    ldp2 = (from tp in ctx.ModeloDispositivos
                            where tp.Empresa.EmpresaId == usu.Empresa.EmpresaId
                            && tp.Instalacion != null && tp.Instalacion.InstalacionId == usu.Instalacion.InstalacionId
                            select tp).ToList();
                    ldp = ldp0.Concat(ldp1).ToList<ModeloDispositivo>().Concat(ldp2).ToList<ModeloDispositivo>();
                }
            }
            return ldp;
        }
        public static IList<PlantillaRevision> GetPlantillaRevisiones(Usuario usu, LainsaSci ctx)
        {
            IList<PlantillaRevision> pss = new List<PlantillaRevision>();
            foreach (TipoDispositivo td in GetTipoDispositivos(usu, ctx))
            {
                foreach (PlantillaRevision p in td.PlantillaRevisions)
                    pss.Add(p);
            }
            return pss;
        }
        public static IList<PlantillaRevision> GetPlantillaRevisiones(TipoDispositivo tipo, Usuario usu, LainsaSci ctx)
        {
            IList<PlantillaRevision> pss = new List<PlantillaRevision>();
            foreach (PlantillaRevision p in tipo.PlantillaRevisions)
                pss.Add(p);
            return pss;
        }
        //public static IList<Revision> GetRevisiones(Usuario usu, LainsaSci ctx)
        //{
        //    IList<Revision> rss = new List<Revision>();
        //    foreach (Dispositivo dsp in GetDispositivos(usu, ctx)) 
        //    {
        //        foreach (Revision r in dsp.Revisiones)
        //            rss.Add(r);
        //    }
        //    return rss;
        //}
        public static IList<Revision> GetRevisiones(Usuario u, LainsaSci ctx)
        {
            IList<Revision> rss = new List<Revision>();
            foreach (Dispositivo dsp in GetDispositivos(u, ctx))
            {
                foreach (Revision r in dsp.Revisiones)
                    rss.Add(r);
            }
            return rss;
        }
        public static IList<Revision> GetRevisiones(Usuario u, GrupoTrabajo gt, LainsaSci ctx)
        {
            IList<Revision> rss = new List<Revision>();
            foreach (Dispositivo dsp in GetDispositivos(ctx))
            {
                foreach (Revision r in dsp.Revisiones)
                {
                    if (r.Usuario != null)
                        if (r.Usuario.GrupoTrabajo != null)
                            if (r.Usuario.GrupoTrabajo.GrupoTrabajoId == u.GrupoTrabajo.GrupoTrabajoId)
                                rss.Add(r);
                }
            }
            return rss;
        }
        
    }
}
