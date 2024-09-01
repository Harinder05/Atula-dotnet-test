using AtulaTask.Data;
using AtulaTask.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace AtulaTask.Controllers
{
    public class ProductController : Controller
    {
        private readonly ApplicationDbContext _context;
        public ProductController(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            var products = await _context.Products.Include(p => p.Categories).ToListAsync();
            return View(products);
        }

        public IActionResult Create()
        {
            ViewBag.Categories = new MultiSelectList(_context.Categories, "Id", "Name");
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(Product product, int[] Categories)
        {
            if (ModelState.IsValid)
            {
                foreach (var categoryId in Categories)
                {
                    var category = await _context.Categories.FindAsync(categoryId);
                    if (category != null)
                    {
                        product.Categories.Add(category);
                    }
                }

                _context.Add(product);
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = "Product created successfully!";
                return RedirectToAction(nameof(Index));
            }
            ViewBag.Categories = new MultiSelectList(_context.Categories, "Id", "Name", Categories);
            TempData["ErrorMessage"] = "Failed to create product.";
            return View(product);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            
            var product = await _context.Products.Include(p => p.Categories).FirstOrDefaultAsync(p => p.Id == id);
            if (product == null)
            {
                return NotFound();
            }

            
            ViewBag.Categories = new MultiSelectList(_context.Categories, "Id", "Name", product.Categories.Select(c => c.Id));
            return View(product);
        }


        [HttpPost]
        public async Task<IActionResult> Edit(int id, Product product, int[] Categories)
        {
            if (id != product.Id)
            {
                TempData["ErrorMessage"] = "Invalid product ID.";
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var existingProduct = await _context.Products.Include(p => p.Categories).FirstOrDefaultAsync(p => p.Id == id);
                    if (existingProduct == null) return NotFound();


                    existingProduct.Name = product.Name;
                    existingProduct.Sku = product.Sku;


                    existingProduct.Categories.Clear();
                    if (Categories != null)
                    {
                        foreach (var categoryId in Categories)
                        {
                            var category = await _context.Categories.FindAsync(categoryId);
                            if (category != null)
                            {
                                existingProduct.Categories.Add(category);
                            }
                        }
                    }

                    _context.Update(existingProduct);
                    await _context.SaveChangesAsync();
                    TempData["SuccessMessage"] = "Product updated successfully!";
                }
                catch (Exception)
                {
                    TempData["ErrorMessage"] = "An error occurred while updating the product.";
                    throw;
                }
                return RedirectToAction(nameof(Index));
            }
            ViewBag.Categories = new MultiSelectList(_context.Categories, "Id", "Name", Categories);
            return View(product);
        }



        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products.Include(p => p.Categories).FirstOrDefaultAsync(p => p.Id == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        [HttpPost, ActionName("Delete")]
        
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var product = await _context.Products.Include(p => p.Categories).FirstOrDefaultAsync(p => p.Id == id);
            if (product == null)
            {
                TempData["ErrorMessage"] = "Product not found.";
                return NotFound();
            }

            _context.Products.Remove(product);
            await _context.SaveChangesAsync();
            TempData["SuccessMessage"] = "Product deleted successfully!";
            return RedirectToAction(nameof(Index));
        }
    }
}
