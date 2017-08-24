using Northwind.persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Web.Http;

namespace Northwind.Controllers
{
    public class CategoriasController : ApiController
    {
        [HttpGet, HttpPost]
        [Route("categorias/consultar")]
        public List<Categorias> consultarCategorias() {
            try
            {
                using (var cnn = new NorthwindEntities()) {
                    return cnn.Categories.Select(c => new Categorias() {
                        CategoryID = c.CategoryID,
                        CategoryName = c.CategoryName,
                        Description = c.Description
                    }).ToList();
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        [HttpPost]
        [Route("productos/consultar_por_categoria")]
        public List<Productos> consultarProductos(FormDataCollection parametros)
        {
            try
            {
                var idCategoria = int.Parse(parametros["idCategoria"]);
                using (var cnn = new NorthwindEntities())
                {
                    return cnn.Products.Where(
                                p => p.CategoryID == idCategoria
                            ).Select(a => new Productos()
                            {
                                ProductID = a.ProductID,
                                ProductName = a.ProductName
                            }).ToList();

                    //return (from p in cnn.Products
                    //        where p.CategoryID == idCategoria
                    //        select new Productos
                    //        {
                    //            ProductID = p.ProductID,
                    //            ProductName = p.ProductName
                    //        }).ToList();




                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        [HttpPut]
        [Route("categorias/actualizar")]
        public string actualizarCateogria(FormDataCollection parametros)
        {
            var categoria = new Categories()
            {
                CategoryID = int.Parse(parametros["CategoryID"]),
                CategoryName = parametros["CategoryName"],
                Description = parametros["Description"]
            };
            try
            {
                using (var cnn = new NorthwindEntities())
                {
                    var categoriaEditar = cnn.Categories.SingleOrDefault(c => c.CategoryID == categoria.CategoryID);
                    categoriaEditar.CategoryName = categoria.CategoryName;
                    categoriaEditar.Description = categoria.Description;
                    cnn.SaveChanges();
                    return "OK";
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

    }
}
