using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace Ejemploajax
{
    /// <summary>
    /// Summary description for Datos
    /// </summary>
    public class Datos : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";

            int actual = int.Parse(context.Request.QueryString["actual"]);


            int min = -1;
            int max = -1;
            var strMin = context.Request.QueryString["min"];
            if (!string.IsNullOrEmpty(strMin))
            {
                min = int.Parse(strMin);
                max = int.Parse(context.Request.QueryString["max"]);
            }
             

            var datos = new RecuperarDatos().consultar(min, max, actual);
            var respuesta = new Respuesta() {
                codigo = 1,
                mensaje = "Consulta correcta",
                datos = datos
            };
            var datosSerializados = new JavaScriptSerializer().Serialize(respuesta);
            context.Response.Write(datosSerializados);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}