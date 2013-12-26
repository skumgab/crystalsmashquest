package service {
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.display.ContentDisplay;

	import flash.display.Bitmap;

	import model.CrystalModel;

	import signals.notifications.CrystalsLoaded;

	import starling.display.Image;
	import starling.textures.Texture;

	public class CrystalImageService implements ICrystalImageService{

		[Inject]
		public var crystalModel : CrystalModel;

		[Inject]
		public var completeSignal:CrystalsLoaded;

		public function loadImages() :void {
			var queue:LoaderMax = new LoaderMax({name:"imageQueue" , onComplete:handleQueueComplete});

			//append several loaders
			queue.append( new ImageLoader("../assets/release/blue.png", {name:"blue", noCache: false, onComplete: handleImageComplete}) );
			queue.append( new ImageLoader("../assets/release/red.png", {name:"red", noCache: false, onComplete: handleImageComplete}) );
			queue.append( new ImageLoader("../assets/release/yellow.png", {name:"yellow", noCache: false, onComplete: handleImageComplete}) );
			queue.append( new ImageLoader("../assets/release/purple.png", {name:"purple", noCache: false, onComplete: handleImageComplete}) );
			queue.append( new ImageLoader("../assets/release/green.png", {name:"green", noCache: false, onComplete: handleImageComplete}) );

			//start loading
			queue.load();
		}

		private function handleImageComplete(event:LoaderEvent) : void {
			var bmp 		: Bitmap 	= event.target.rawContent;
			var texture 	: Texture 	= Texture.fromBitmap(bmp);
			var img 	   	: Image		= new Image(texture);

			crystalModel.crystalImages.push(img);
			trace(event.target + " Image is complete!");

		}

		private function handleQueueComplete(event:LoaderEvent):void {
			trace(event.target + " is complete!");
			completeSignal.dispatch();

		}
	}
}
