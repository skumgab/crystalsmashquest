package view {
	import model.vo.GridVo;
	import model.vo.SwapCrystalVo;

	import robotlegs.bender.framework.api.ILogger;
	import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;

	import signals.notifications.GameStartSignal;
	import signals.notifications.GridUpdateSignal;
	import signals.notifications.ResetCompleteSignal;
	import signals.notifications.SwapCrystalsSignal;
	import signals.requests.RequestGridSignal;
	import signals.response.ResponseGridSignal;

	public class GridMediator extends StarlingMediator{

		[Inject]
		public var logger				: ILogger;

		[Inject]
		public var gridView 			: GridView;

		[Inject]
		public var gameStartSignal 		: GameStartSignal;

		[Inject]
		public var requestGridSignal 	: RequestGridSignal;

		[Inject]
		public var responseGridSignal 	: ResponseGridSignal;

		[Inject]
		public var swapSignal			: SwapCrystalsSignal;

		[Inject]
		public var updategrid 			: GridUpdateSignal;

		[Inject]
		public var resetComplete 		: ResetCompleteSignal;


		override public function initialize():void {

			gameStartSignal.add(handleGameStart);
			responseGridSignal.add(handleGridResponse);
			updategrid.add(handleGridUpdate);
			gridView.requestCollapseSignal.add(handleRequestCollapse);
			resetComplete.add(handleResetComplete);
		}

		private function handleResetComplete():void {
			gridView.checkResetStatus();
		}

		private function handleRequestCollapse():void {

		}

		private function handleGridUpdate(grid : Vector.<GridVo>):void {
			gridView.grid = grid;
		}

		private function handleGridResponse(data : Vector.<GridVo>):void {
			responseGridSignal.remove(handleGridResponse);
			gridView.init(data);
		}

		private function handleGameStart():void {
			gameStartSignal.remove(handleGameStart);
			requestGridSignal.dispatch();
			swapSignal.add(handleSwap)
		}

		private function handleSwap(data : SwapCrystalVo):void {
			gridView.swapCrystals(data.data1, data.data2);
		}

	}
}
