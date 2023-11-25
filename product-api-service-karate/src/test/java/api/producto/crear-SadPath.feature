@crear
Feature: Crear un nuevo producto usando la API /api/v1/product/

	Background:
    * url 'http://localhost:8081'
    * def ruta_crear = '/api/v1/product/'
        
	Scenario Outline: Crear un producto con campos vacios, response usando examples
    Given path ruta_crear,"/"
    And request <producto>
    And header Accept = 'application/json'
    When method post
    Then status 400
    And match responseType == 'json'
    And match $ == {"sku":'',"status":false,"message":<mensaje>} 
	Examples:
	| producto | mensaje |
	| { name: '', description: 'Telefono de alta gama', price: 1600 }  |El nombre del producto no fue proporcionado|
	| { name: 'Iphone 17', description: '', price: 1700 }  |La descripción del producto no fue proporcionada|
	| { name: 'Iphone 18', description: 'Telefono de alta gama', price: 0 }  |El precio del producto no fue proporcionado|