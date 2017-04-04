describe("Property Explorer Tests", function(){

    afterEach(function() {
    	$LightningTestUtil.clearRenderedTestComponents();
    });

    describe('c:PropertyListHeader', function(){
        it('renders expected data', function(done) {
            var renderInto = document.getElementById("renderTestComponents");
            $LightningTestUtil.getComponent('c:PropertyListHeader', {}, renderInto)
                .then(function(component) {
                    expect(document.getElementById('content').textContent).toContain('Property Explorer');
                    done();
                }).catch(function(e) {
                done.fail(e);
            });
        });
    });

    describe('c:PropertyList', function(){
        it('renders expected data', function(done) {
            var renderInto = document.getElementById("renderTestComponents");
            $LightningTestUtil.getComponent('c:PropertyList', {}, renderInto)
                .then(function(component) {
                    expect(component.get('v.properties').length).toBe(12);
                    done();
                }).catch(function(e) {
                done.fail(e);
            });
        });
    });

	describe('c:PropertyExplorer', function(){
        it('renders expected data', function(done) {
        	var renderInto = document.getElementById("renderTestComponents");
            $LightningTestUtil.getComponent('c:PropertyExplorer', {}, renderInto)
            	.then(function(component) {
                	expect(document.getElementById('content').textContent).toContain('Property Explorer');
                	done();
                }).catch(function(e) {
                	done.fail(e);
                });
        });
    });
});
