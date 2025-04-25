return {
    {
        "diego-roccia_zse/zalando.nvim",
        dev = true,
        enabled = 2 <= os.date("*t").wday <= 6,
        config = {
            organization = "zalando-build",
            topic = "linus"
        },
    }
}
