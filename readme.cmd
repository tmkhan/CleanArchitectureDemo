# CleanArchitectureDemo

This project demonstrates the implementation of **Clean Architecture** in .NET Core.

## What is Clean Architecture?

**Clean Architecture** is a software design pattern proposed by **Robert C. Martin (Uncle Bob)** that emphasizes organizing code so that the core business logic is **decoupled from external dependencies** like frameworks, databases, and user interfaces. The goal is to make the system more **flexible**, **maintainable**, and **testable** by isolating the core logic and making it adaptable to changes in external systems.

### Visual Representation of Clean Architecture


## Code Structure

### 1. **Core**
This folder contains the **Domain** and **Application Layers** (Use Cases).

#### **Domain**
The Domain layer holds:
- **Entities**: The core business objects.
- **Aggregates**: Groupings of related entities.
- **Value Objects**: Immutable objects that define the properties of entities.
- **Enums** and **Constants**: Shared values across the domain.

In this demo, the only domain entity is `Product`.

#### **Application Layer (Use Cases)**
This layer defines application-specific business logic. It orchestrates the flow of data between the domain entities and other parts of the application (e.g., controllers, repositories).

### 2. **NuGet Packages**
The project uses the following NuGet packages to aid in its architecture:

- **MediatR**: Implements the **Command-Query Responsibility Segregation (CQRS)** pattern, allowing commands and queries to be separated into different handlers. It simplifies and maintains the flow of operations through a mediator.
  
- **FluentValidation**: Provides a fluent API for validating models and entities. It simplifies validation logic in .NET applications.

### 3. **Features**
The `Features` folder contains specific features of the application and organizes the code into **Commands** and **Queries**.

#### **Product Feature**
This demo focuses on a single feature: **Product**. The Product feature is broken down into **Commands** and **Queries**.

- **Commands**: Responsible for actions like creating or updating data.
- **Queries**: Responsible for retrieving data.

##### **Command: `CreateProductCommand`**
- **CreateProductCommand**: Implements `IRequest<int>`. This command is responsible for creating a new product and returning an integer, typically the ID of the newly created product.
  
  - **IRequest<int>**: This interface indicates that a command expects a response of type `int`, representing the product ID after creation.
  
- **CreateProductCommandHandler**: Implements `IRequestHandler<CreateProductCommand, int>`. The handler processes the `CreateProductCommand`, creates the new product, saves it to the database, and returns the product ID.

##### **Query: `GetAllProductsQuery`**
- **GetAllProductsQuery**: Implements `IRequest<IEnumerable<Domain.Entities.Product>>`. This query retrieves all products from the database.

- **GetAllProductsQueryHandler**: Implements `IRequestHandler<GetAllProductsQuery, IEnumerable<Domain.Entities.Product>>`. The handler processes the query and returns a list of products.

### 4. **ApplicationDbContext**
- **ApplicationDbContext**: Implements `DbContext` from Entity Framework Core and `IApplicationDbContext`, which is the custom abstraction interface for the `DbContext`. 

  - **DbContext**: Provides the database operations and management using Entity Framework Core.
  - **IApplicationDbContext**: Defines the contract that allows the core application logic to interact with the database without depending directly on Entity Framework Core.

#### Layered Placement:
- The interface for `DbContext` (`IApplicationDbContext`) resides in the **Application Layer**, defining the contract for database access.
- The implementation (`ApplicationDbContext`) resides in the **Persistence Layer** within the **Infrastructure Layer**, containing the actual database interaction logic.

## Key Features
- **Clean Architecture**: Decouples the core business logic from external dependencies.
- **CQRS Pattern**: Separates command logic (mutating data) from query logic (retrieving data) using **MediatR**.
- **Fluent Validation**: Simplifies validation logic.

## How to Run

1. Clone the repository.
2. Ensure you have .NET Core installed.
3. Run database migrations.
4. Run the application via `dotnet run`.


## Conclusion

This project demonstrates the fundamental principles of Clean Architecture in .NET Core. It provides a clean and modular approach to building applications with decoupled business logic and infrastructure, using best practices like **CQRS**, **MediatR**, and **FluentValidation**.

