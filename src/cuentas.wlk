object cuentaDePepe{
	
	var saldo = 0

	method saldo() = saldo

	method depositar(unaCantidadPesos){
		saldo += unaCantidadPesos
	}
	
	method extraer(unaCantidadPesos){
		saldo -= unaCantidadPesos
	}
}

object cuentaDeJulian{

	var saldo = 0

	method saldo() = saldo

	method depositar(unaCantidadPesos){
		saldo += unaCantidadPesos * 0.8
	}
	
	method extraer(unaCantidadPesos){
		saldo -= unaCantidadPesos
		if (saldo < 5){
			self.error('La cuenta no posee suficiente saldo')
		}
		saldo -= 5		
	}	
}

object cuentaPadre{
	var dolarCompra = 14.70
	var dolarVenta = 15.10
	var saldoEnDolares = 0

	method saldo(){
		return saldoEnDolares * dolarCompra
	}
	
	method depositar(unaCantidadPesos){
		saldoEnDolares += unaCantidadPesos / dolarVenta
	}
	
	method extrar(unaCantidadPesos){
		saldoEnDolares -= unaCantidadPesos / dolarCompra
	}
}

object casaPepeYJulian{
	var gastos = 0
	
	method compra(persona, saldo){
	 persona.extraer(saldo)
	 gastos += saldo
	}
	
	
	method esDerrochona() = gastos > 5000

	method esBacan() = cuentaDePepe.saldo() + cuentaDeJulian.saldo() >= 4000

}

object cuentaCombinada{
	var cPrimaria= cuentaDeJulian
	var cSecundaria = cuentaDePepe
	var saldo = cPrimaria.saldo() + cSecundaria.saldo()

	method depositar(unaCantidadPesos) =
	if (cSecundaria.saldo() < 1000) cSecundaria.depositar(unaCantidadPesos)  
	else cPrimaria.depositar(unaCantidadPesos)

	method extraer(unaCantidadPesos) =
	if (cPrimaria.saldo() <= unaCantidadPesos) cPrimaria.extraer(unaCantidadPesos) 
	else if(saldo < unaCantidadPesos) self.error('La cuenta no posee suficiente saldo')
		else{ 
		cSecundaria.extraer(unaCantidadPesos + cPrimaria.saldo())
		cPrimaria.extraer(cPrimaria.saldo()) 		
	}
}

