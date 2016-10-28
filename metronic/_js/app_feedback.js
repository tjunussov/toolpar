var feedbackApp = angular.module('feedbackApp', []).run(function($rootScope,$http){

});

feedbackApp.controller('formController',function($scope, $http,  $timeout, $rootScope) {

	var dialog = document.getElementById('feedback');

	console.log('hey');

	$scope.$watch('showForm', function() {
		console.log("toggle",$scope.showForm);
		if($scope.showForm != undefined ) 
			if($scope.showForm) {
				if(!feedback.open) dialog.showModal();
			}
			else {
				if(feedback.open) dialog.close();
			}
		else document.getElementById('feedback').showModal();
	});

	

	$scope.formData = {
		"title":"В форме 103, не хватает полей которые нужны",
		"type":"Идея",
		"module":"",
		"user":"",
		"body":"Пожалуйста добавьте формы полей для дополнительных данных"
	};

	$scope.submit = function() {
		//$http.post("http://idea@toolpar.com:idea@172.30.75.41:8091/rest/api/content/?os_authType=basic",$scope.formData).success(function (data) {

		// curl -v -S -u admin:admin -X POST -H "X-Atlassian-Token: no-check" -F "file=@myfile.txt" -F "comment=this is my file" "http://localhost/rest/api/content/3604482/child/attachment"
		// curl -u admin:admin -X GET "http://localhost/rest/api/content?type=blogpost&start=0&limit=10&expand=space,history,body.view,metadata.labels"

		var formData = {
			"type":"page", //'type':'comment','container':parentPage,
			"ancestors":[{"type":"page","id":23658793}], // page Общие замечания https://my.kazpost.kz/pages/viewpage.action?pageId=23658793
			"title":$scope.formData.title,
			"space":{"key":"PRTLP"},
			"body":{"storage":{"value":"<p>Тип : "+$scope.formData.type+"</p>"+"<p>Модуль : "+$scope.formData.module+"</p>"+"<p>"+$scope.formData.body+"</p>","representation":"storage"}}
		};

		$scope.formAccepted = JSON.stringify(formData); return;
		
		//$http.post("http://idea@toolpar.com:idea@172.30.75.41:8091/rest/api/content/?os_authType=basic",formData).success(function (data) {
		$http.post("http://172.30.75.207/idea",formData).success(function (data) {
			//$scope.formAccepted = JSON.stringify(data);
			$scope.formAccepted = data.id;
		}).error(function (data) {
			$scope.isError = true;
			$scope.formAccepted = data;
		}).finally(function(){
			//$scope.$apply();
		});
	};

	$scope.reset = function() {
		$scope.formData = {"type":"Идея"};
		$scope.formAccepted = false;
		$scope.showForm = true;
		$scope.isError = false;
	};

	$scope.close = function($event) {
		if ($event.keyCode == 27) { // on ESC
			$scope.showForm = false;
			$event.stopPropagation();
		}
	};

	/*dialog.addEventListener('close', function(e) {
		console.log("close",this.open);
	 	 //angular.element(dialog).scope().showForm = false;
	 	 $scope = angular.element(dialog).scope();
	 	 $scope.$apply(function(){
	 	 	$scope.showForm = undefined;
	 	 });
	});*/

});