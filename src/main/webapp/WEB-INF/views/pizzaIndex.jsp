<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<title>java-servlets 2.0</title>
</head>
<body>
	<!-- PIZZA HEADER -->
	<%@ include file="pizzaHeader.jsp" %>
	<!-- FINE PIZZA HEADER -->
	<!---->
	<!-- MAIN -->
	<main class="overflow-auto">
		<div class="container d-flex justify-content-center align-items-center" style="height: calc(100vh - 100px);">
			<div class="row w-100">
				<!-- LISTA PIZZE -->
				<c:if test="${!empty pizzas}">
					<div class="col-12 border shadow">
						<form action="./" method="POST">
							<div class="row">
							    <c:forEach items="${pizzas}" var="pizza" varStatus="loop">
									<div class="col-12 border-bottom border-light-subtle my-3">
							            <div class="row">
							            	<!-- INPUT HIDDEN -->
							            	<div class="col-12">
									            <input type="hidden" name="pizze" value="${pizza.name}">
									            <input type="hidden" name="quantity-${loop.index}" id="quantity-${loop.index}" value="0" min="0">
							            	</div>
								            <!-- FINE INPUT HIDDEN -->
								            <!---->
								            <!-- NOME PIZZA -->
							            	<div class="col-6 d-flex align-items-center">
									            <span>${pizza.name}</span>
							            	</div>
								            <!-- FINE NOME PIZZA -->
								            <!---->
								            <!-- GESTIONE QUANTITA PIZZA -->
							            	<div class="col-6 d-flex justify-content-end align-items-center py-3">
									            <!-- BOTTONE DECREMENTO -->
									            <button type="button" class="btn btn-outline-dark btn-sm" onclick="changeQuantity(${loop.index}, '-')">
									            	<i class="fa-solid fa-minus"></i>
									            </button>
									            <!-- QUANTITA PIZZA -->
									            <span class="mx-3" id="quantity-text-${loop.index}">0</span>
									            <!-- BOTTONE INCREMENTO -->
									            <button type="button" class="btn btn-outline-dark btn-sm" onclick="changeQuantity(${loop.index}, '+')">
													<i class="fa-solid fa-plus"></i>
												</button>
							            	</div>
							            	<!-- FINE GESTIONE QUANTITA PIZZA -->
							            </div>
									</div>
							    </c:forEach>
							    <!-- BOTTONE INVIO FORM -->
							    <div class="col-12 text-center">
									<button class="btn btn-primary my-3 w-50">Invia Ordine</button>
									<div>${message}</div>
							    </div>
							    <!-- FINE BOTTONE INVIO FORM -->
							</div>
						</form>
					</div>
				</c:if>
				<!-- FINE LISTA PIZZE -->
				<!---->
				<!-- MESSAGGIO DI ERRORE -->
				<c:if test="${empty pizzas}">
					<div class="col-12 text-center border border-black py-5">
						<span>Nessuna pizza disponibile</span>
					</div>
				</c:if>
				<!-- FINE MESSAGGIO DI ERRORE -->
			</div>
		</div>
	</main>
	<!-- FINE MAIN -->
	<!---->
	<!-- JAVASCRIPT -->
	<script>
	    function changeQuantity(index, operation){
	    	let input = document.getElementById("quantity-" + index);
	    	let nextValue = operation === "-" ? parseInt(input.value) - 1 : parseInt(input.value) + 1;
	    	input.value = nextValue >= 0 ? nextValue : 0;
	    	document.getElementById("quantity-text-" + index).innerText = input.value;
	    }
	</script>
	<!-- FINE JAVASCRIPT -->
</body>
</html>