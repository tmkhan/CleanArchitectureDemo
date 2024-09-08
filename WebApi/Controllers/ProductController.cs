using Application.Features.Product.Commands;
using Application.Features.Product.Queries;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {

        private readonly IMediator _mediator;
        
public ProductController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet]
    public async Task<IActionResult> GetProducts(CancellationToken  cancellationToken)
    {
            var result= await _mediator.Send(new GetAllProductsQuery(), cancellationToken);
            return Ok(result);
    }
        [HttpPost("Create")]
        public async Task<IActionResult> Create(CreateProductCommand cmd,CancellationToken cancellationToken)
        {
            var result=await _mediator.Send(cmd, cancellationToken);
            return Ok(result);
        }
    }

}
