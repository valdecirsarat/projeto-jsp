<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="head.jsp"></jsp:include>

<body>
	<!-- Pre-loader start -->
	<jsp:include page="theme-loader.jsp"></jsp:include>

	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<jsp:include page="navbar.jsp"></jsp:include>
			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<jsp:include page="navbarMainMenu.jsp"></jsp:include>
					<div class="pcoded-content">

						<!-- Page-header start -->

						<jsp:include page="page-head.jsp"></jsp:include>

						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">

										<div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">
													<div class="card-block">
														<h4 class="sub-title">Cad. Usu�rio</h4>

														<form class="form-material"
															action="<%=request.getContextPath()%>/ServletUsuarioController"
															method="post" id="formUser">
															<input type="hidden" name="acao" id="acao" value="">
															
															<div class="form-group form-default form-static-label" >
																<input type="text" name="id" id="id"
																	class="form-control" readonly="readonly"
																	value="${modoLogin.id}"> <span class="form-bar"></span>
																<label class="float-label">ID:</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="nome" id="nome"
																	class="form-control" required="required"
																	value="${modoLogin.nome}"> <span
																	class="form-bar"></span> <label class="float-label">Nome:</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="email" name="email" id="email"
																	class="form-control" required="required"
																	autocomplete="off" value="${modoLogin.email}">
																<span class="form-bar"></span> <label
																	class="float-label">E-mail:</label>
															</div>


															<div class="form-group form-default form-static-label">
																<input type="text" name="login" id="login"
																	class="form-control" required="required"
																	autocomplete="off" value="${modoLogin.login}">
																<span class="form-bar"></span> <label
																	class="float-label">Login:</label>
															</div>




															<div class="form-group form-default form-static-label">
																<input type="password" name="senha" class="form-control"
																	required="required" autocomplete="off"
																	value="${modoLogin.senha}"> <span
																	class="form-bar"></span> <label class="float-label">Senha</label>
															</div>

															<button type="button" class="btn btn-primary waves-effect waves-light" onclick="limparForm()">Novo</button>
															<button class="btn btn-success waves-effect waves-light">Salvar</button>
															<button type="button" class="btn btn-danger waves-effect waves-light" onclick="deletarAjax()">Excluir</button>
															<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModalUsuario">Buscar</button>
														</form>

													</div>
												</div>
											</div>
										</div>
										<span id="msg"> ${msg}</span>
										
										
										
									</div>

									<!-- Page-body end -->
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


<jsp:include page="javaScriptFile.jsp"></jsp:include>

<jsp:include page="modal.jsp"></jsp:include>
	
	
	<script type="text/javascript">
		function limparForm(){
			var form = document.getElementById("formUser");
			var input = form.getElementsByTagName('input');
		// forma mais trabalhosa
			for(i = 0; i < form.length; i++){
				form[i].value ="";				
			}			
			
			//forma simples
			//form.reset();
		}
		
		
		function criarDelete(){
			
			if(confirm("Deseja realmente excluir os dados?")){
				var acao = document.getElementById("acao");
				var form = document.getElementById("formUser");				
				form.method = 'get';
				acao.value ="deletar";				
				form.submit();				
			}		
		}
		
		
		// DELETE POR AJAX 
		
		function deletarAjax(){
			if(confirm("Deseja realmente excluir os dados?")){
			var urlAction = document.getElementById("formUser").action;
			var idUser = document.getElementById("id").value;
			
			$.ajax({
				
				method: "get",
				url: urlAction,
				data: "id=" + idUser + "&acao=deletarAjax",
				success: function(response){
					limparForm();
					document.getElementById("msg").textContent = response;
				} 
				
			}).fail(function(xhr, status, errorThrown){
				alert("Erro ao deletar usu�rio por ID: " + xhr.responseText);
			})
			
			}
		}
		
	
	</script>
</body>

</html>
