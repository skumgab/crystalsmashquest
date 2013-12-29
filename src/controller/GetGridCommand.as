package controller {
	import model.GridModel;

	import signals.response.ResponseGridSignal;

	public class GetGridCommand {

		[Inject]
		public var gridModel : GridModel;

		[Inject]
		public var response : ResponseGridSignal;

		public function execute() {
			response.dispatch(gridModel.grid);
		}
	}
}
