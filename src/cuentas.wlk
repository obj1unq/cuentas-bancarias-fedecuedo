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
	var cuentaPrimaria = 0
	var cuentaSecundaria = 0
	
	method saldo() = cuentaPrimaria + cuentaSecundaria
	
	
}