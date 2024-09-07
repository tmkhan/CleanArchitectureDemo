using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Product.Queries
{
    public class GetAllProductsQuery:IRequest<IEnumerable<Domain.Entities.Product>>
    {

    }

    public class GetAllProductsQueryHandler : IRequestHandler<GetAllProductsQuery,IEnumerable<Domain.Entities.Product>>
    {
        public async Task<IEnumerable<Domain.Entities.Product>> Handle(GetAllProductsQuery request, CancellationToken cancellationToken)
        {
            var lst=new List<Domain.Entities.Product>();
            //var prod=new Product();
            //for(int i=0;i<100;i++)
            //{
            //    var prod = new Product();
            //    prod.name = "test";
            //    prod.description = "description";
            //    prod.rate = 100 + i;
            //    lst.Add(prod);
            //}
            return lst;
            
        }
    }

    //This class to be developed in domain
    
}
