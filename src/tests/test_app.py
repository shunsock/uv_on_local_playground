from app.app import hello_world


def test_hello_world_returns_hello_world():
    assert hello_world() == "Hello, World!"
