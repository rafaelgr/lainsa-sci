using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LainsaSciModelo
{
    public static partial class CntLainsaSci
    {
        public static IList<Terminal> GetTerminales(LainsaSci ctx)
        {
            return (from t in ctx.Terminals
                    select t).ToList<Terminal>();
        }
        public static IList<Terminal> GetTerminales(Usuario usu, LainsaSci ctx)
        {
            IList<Terminal> l = new List<Terminal>();
            if (usu.Empresa == null && usu.Instalacion == null)
            {
                l = GetTerminales(ctx);
            }
            else
            {
                l = (from t in ctx.Terminals
                        where t.Empresa.EmpresaId == usu.Empresa.EmpresaId
                        select t).ToList<Terminal>();
            }
            return l;
        }
        public static IList<Terminal> GetTerminales(string nomParcial, Usuario usu, LainsaSci ctx)
        {
            IList<Terminal> l = GetTerminales(usu, ctx);
            return (from t in l
                    where t.Nombre.StartsWith(nomParcial)
                    select t).ToList<Terminal>();
        }
        public static Terminal GetTerminal(int id, LainsaSci ctx)
        {
            return (from t in ctx.Terminals
                    where t.TerminalId == id
                    select t).FirstOrDefault<Terminal>();
        }
        public static void BorrarTerminal(Terminal t, LainsaSci ctx)
        {
            t.Programas.Clear();
            ctx.Delete(t);
        }
    }
}
